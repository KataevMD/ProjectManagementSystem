using Microsoft.AspNetCore.Mvc.Rendering;
using ProjectManagementSystem.Entities;

namespace ProjectManagementSystem.Models
{
    public class EmployeeProjectsViewModel
    {
        public Project? Project { get; set; }
        public List<Employee> Employees { get; set;}


    }
}
