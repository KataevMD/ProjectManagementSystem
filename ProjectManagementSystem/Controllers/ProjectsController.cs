using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProjectManagementSystem.Entities;

namespace ProjectManagementSystem.Controllers
{
    public class ProjectsController : Controller
    {
        private readonly ApplicationContext _context;
        private readonly IWebHostEnvironment _appEnvironment;

        public ProjectsController(ApplicationContext context, IWebHostEnvironment appEnvironment)
        {
            _context = context;
            _appEnvironment = appEnvironment;
        }

        // GET: Projects
        public async Task<IActionResult> Index()
        {
            return View(await _context.Projects.ToListAsync());
        }

        // GET: Wizard
        public async Task<IActionResult> Wizard()
        {
            Models.ProjectViewModel projectViewModel = new Models.ProjectViewModel()
            {
                Developers = new SelectList(_context.Employees.Where(emp => emp.Roles.Title == "Developer"), "EmployeeId", "FullName"),
                ProjectManagers = new SelectList(_context.Employees.Where(emp => emp.Roles.Title == "Project manager"), "EmployeeId", "FullName"),
            };

            return PartialView(projectViewModel);
        }

        // GET: AddEmployeeToProject
        public async Task<IActionResult> AddEmployeeToProject(int? ProjectId)
        {
            if (ProjectId == null)
            {
                return NotFound();
            }
            var project = await _context.Projects.FirstOrDefaultAsync(p => p.ProjectId == ProjectId);

            if (project == null)
            {
                return NotFound();
            }

            var listEmployeeProject = _context.EmployeeProjects.Where(ep => ep.ProjectId == project.ProjectId);
            var listEmployeesId = listEmployeeProject.Select(e => e.EmployeeId);
            var listEmployees = _context.Employees.Where(emp => !listEmployeesId.Contains(emp.EmployeeId)).Include(c => c.Roles).ToList();

            Models.ProjectViewModel projectViewModel = new Models.ProjectViewModel()
            {
                Project = project,
                Developers = new SelectList(listEmployees.Where(emp => emp.Roles.Title == "Developer"), "EmployeeId", "FullName"),
                ProjectManagers = new SelectList(listEmployees.Where(emp => emp.Roles.Title == "Project manager"), "EmployeeId", "FullName"),
            };
            return PartialView(projectViewModel);
        }

        // GET: AddEmployeeToProject
        public async Task<IActionResult> SaveEmployeeToProject()
        {
            int idProject = int.Parse(Request.Form["idProject"]);

            var project = await _context.Projects.FindAsync(idProject);
            if (project == null)
            {
                return NotFound();
            }

            int projectsManagerId = int.Parse(Request.Form["ProjectManagers"]);

            var projectManager = await _context.Employees.FindAsync(projectsManagerId);

            if (projectManager == null)
            {
                return NotFound();
            }

            List<string> listProjectDeveloperId = Request.Form["Developers"].ToList();
            List<Employee> listDevelopers = new List<Employee>();
            foreach (string id in listProjectDeveloperId)
            {
                var developer = await _context.Employees.FindAsync(int.Parse(id));
                if (developer != null)
                {
                    listDevelopers.Add(developer);
                }
            }

            EmployeeProject newProjectManager = new EmployeeProject()
            {
                ProjectId = project.ProjectId,
                EmployeeId = projectManager.EmployeeId,
                IsProjectManager = true
            };

            _context.Add(newProjectManager);

            foreach (Employee employee in listDevelopers)
            {
                EmployeeProject newProjectDeveloper = new EmployeeProject()
                {
                    ProjectId = project.ProjectId,
                    EmployeeId = employee.EmployeeId,
                    IsProjectManager = false
                };
                _context.Add(newProjectDeveloper);
            }
            _context.SaveChanges();

            return RedirectToAction(nameof(Index));
        }

        // GET: Projects/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var project = await _context.Projects.Include(ep => ep.EmployeesProjects)
                .FirstOrDefaultAsync(m => m.ProjectId == id);

            if (project == null)
            {
                return NotFound();
            }

            var listEmployeeProject = _context.EmployeeProjects.Where(ep => ep.ProjectId == project.ProjectId);
            var listEmployeesId = listEmployeeProject.Select(e => e.EmployeeId);
            var listEmployees = _context.Employees.Where(emp => listEmployeesId.Contains(emp.EmployeeId)).Include(c => c.Roles).ToList();

            Models.EmployeeProjectsViewModel employeeProjectsViewModel = new Models.EmployeeProjectsViewModel()
            {
                Project = project,
                Employees = listEmployees
            };

            return View(employeeProjectsViewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateNewProject()
        {
            string titleProject = Request.Form["Project.Title"];
            DateOnly dateStart = DateOnly.Parse(Request.Form["Project.StartDate"]);
            DateOnly dateEnd = DateOnly.Parse(Request.Form["Project.EndDate"]);
            int projectPriority = int.Parse(Request.Form["Project.ProjectPriority"]);

            int projectsManagerId = int.Parse(Request.Form["ProjectManagers"]);
            List<string> listProjectDeveloperId = Request.Form["Developers"].ToList();

            string titleCustomersCompany = Request.Form["Project.TitleCustomersCompany"];
            string titleContractorsCompany = Request.Form["Project.TitleContractorsCompany"];

            IFormFileCollection uploaderFile = Request.Form.Files;

            Project newProject = new Project()
            {
                Title = titleProject,
                StartDate = dateStart,
                EndDate = dateEnd,
                ProjectPriority = projectPriority,
                TitleContractorsCompany = titleContractorsCompany,
                TitleCustomersCompany = titleCustomersCompany

            };
            if (uploaderFile != null)
            {
                Models.FileSaver.SaveFile(_appEnvironment, uploaderFile, titleProject);
            }

            newProject.ProjectFilePath = "DownloadFiles/" + titleProject;

            _context.Add(newProject);
            _context.SaveChanges();

            EmployeeProject newProjectManager = new EmployeeProject()
            {
                ProjectId = newProject.ProjectId,
                EmployeeId = projectsManagerId,
                IsProjectManager = true
            };

            _context.Add(newProjectManager);

            foreach (string developerId in listProjectDeveloperId)
            {
                EmployeeProject newProjectDeveloper = new EmployeeProject()
                {
                    ProjectId = newProject.ProjectId,
                    EmployeeId = int.Parse(developerId),
                    IsProjectManager = false
                };
                _context.Add(newProjectDeveloper);
            }
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        // GET: Projects/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var project = await _context.Projects.FindAsync(id);
            if (project == null)
            {
                return NotFound();
            }
            return View(project);
        }

        // POST: Projects/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProjectId,Title,TitleCustomersCompany,TitleContractorsCompany,StartDate,EndDate,ProjectPriority,ProjectFilePath")] Project project)
        {
            if (id != project.ProjectId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(project);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProjectExists(project.ProjectId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(project);
        }

        // GET: Projects/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var project = await _context.Projects
                .FirstOrDefaultAsync(m => m.ProjectId == id);
            if (project == null)
            {
                return NotFound();
            }

            return View(project);
        }
        // GET: Projects/Delete/5
        public async Task<IActionResult> DeleteEmoployeeFromProject(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var emplProject = await _context.EmployeeProjects.Where(e => e.EmployeeId == id).FirstOrDefaultAsync();
            if (emplProject != null)
            {
                _context.Remove(emplProject);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }


        // POST: Projects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var project = await _context.Projects.FindAsync(id);
            if (project != null)
            {
                _context.Projects.Remove(project);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProjectExists(int id)
        {
            return _context.Projects.Any(e => e.ProjectId == id);
        }
    }
}
