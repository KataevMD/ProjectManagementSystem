namespace ProjectManagementSystem.Entities
{
    public class Role
    {
        public int RoleId { get; set; }
        public string Title { get; set; }
        public virtual List<Employee> ListEmployees { get; set; }
    }
}
