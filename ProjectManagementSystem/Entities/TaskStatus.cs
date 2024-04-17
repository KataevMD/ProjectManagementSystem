namespace ProjectManagementSystem.Entities
{
    public class TaskStatus
    {
        public int TaskStatusId { get; set; }
        public string Title { get; set;}
        public virtual List<Task> Tasks { get; set; }
    }
}
