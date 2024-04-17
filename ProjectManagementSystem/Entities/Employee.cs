namespace ProjectManagementSystem.Entities
{
    public class Employee
    {
        public int EmployeeId {  get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string? Patronymic { get; set; }
        public string Email { get; set; }
        public int RoleId { get; set; }
        public virtual Role Roles { get; set; }
        public virtual List<Project> Projects { get; set; } = new();
        public virtual List<EmployeeProject> EmployeesProjects { get; set; } = new();
        public virtual User? Users { get; set; }

        public virtual List<Task>? AuthorTasks { get; set; } = new();
        public virtual List<Task>? ContractorTasks { get; set; } = new();
        
        public string FullName { get {  return $"{LastName} {FirstName} {Patronymic}"; } }
    }
}
