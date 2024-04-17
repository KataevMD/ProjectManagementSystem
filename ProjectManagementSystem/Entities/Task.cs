using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace ProjectManagementSystem.Entities
{
    public class Task
    {
        public int TaskId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }

        public int TaskStatusId { get; set; }
        public virtual TaskStatus Status { get; set; }

        public int TaskPriority { get; set; }

        public int ProjectId { get; set; }
        public virtual Project Project { get; set; }
        
        public int? AuthorTaskId { get; set; }
        public virtual Employee? AuthorTask { get; set; }

       
        public int? ContractorTaskId { get; set; }
        public virtual Employee? ContractorTask { get; set; }


    }

}
