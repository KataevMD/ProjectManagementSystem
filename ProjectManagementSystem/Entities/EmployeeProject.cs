namespace ProjectManagementSystem.Entities
{
    public class EmployeeProject
    {
        public int ProjectId { get; set; }
        public virtual Project Project { get; set; }

        public int EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }

        public bool? IsProjectManager { get; set; }

    }
}
