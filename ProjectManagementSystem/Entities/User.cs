namespace ProjectManagementSystem.Entities
{
    public class User
    {
        public int UserId { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public int EmployeeId { get; set; }
        public virtual Employee Employees { get; set; }
    }
}
