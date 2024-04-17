using Microsoft.AspNetCore.Mvc.Rendering;
using ProjectManagementSystem.Entities;

namespace ProjectManagementSystem.Models
{
    public class ProjectViewModel
    {
        public Project? Project { get; set; }
        public SelectList ProjectManagers { get; set; }
        public SelectList Developers { get; set; }


    }
}
