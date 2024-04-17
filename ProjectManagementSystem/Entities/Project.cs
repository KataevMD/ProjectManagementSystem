using Microsoft.Extensions.Hosting;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjectManagementSystem.Entities
{
    public class Project
    {
        public int ProjectId { get; set; }
        public string Title { get; set; }
        public string TitleCustomersCompany { get; set; }
        public string TitleContractorsCompany { get; set; }
        public DateOnly StartDate { get; set; }
        public DateOnly EndDate { get; set; }
        public int ProjectPriority { get; set; }
        public string ProjectFilePath { get; set; }
        public virtual List<Employee> Employees { get; set; } = new();
        public virtual List<EmployeeProject> EmployeesProjects { get; set; } = new();
        public virtual List<Task> Tasks { get; set; } = new();
    }

}
