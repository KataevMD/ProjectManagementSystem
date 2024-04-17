using Microsoft.EntityFrameworkCore;

namespace ProjectManagementSystem.Entities
{
    public class ApplicationContext : DbContext
    {
        public ApplicationContext()
        {

        }
        public DbSet<Employee> Employees { get; set; } = null!;
        public DbSet<Project> Projects { get; set; } = null!;
        public DbSet<User> Users { get; set; } = null!;
        public DbSet<EmployeeProject> EmployeeProjects { get; set; } = null!;
        public DbSet<Role> Roles { get; set; } = null!;
        public DbSet<Task> Tasks { get; set; } = null!;
        public DbSet<TaskStatus> TaskStatuses { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // использование Fluent API
            base.OnModelCreating(modelBuilder);

            modelBuilder
            .Entity<Project>()
            .HasMany(c => c.Employees)
            .WithMany(s => s.Projects)
            .UsingEntity<EmployeeProject>(
               j => j
                .HasOne(pt => pt.Employee)
                .WithMany(t => t.EmployeesProjects)
                .HasForeignKey(pt => pt.EmployeeId),
            j => j
                .HasOne(pt => pt.Project)
                .WithMany(p => p.EmployeesProjects)
                .HasForeignKey(pt => pt.ProjectId),
            j =>
            {
                j.Property(pt => pt.IsProjectManager).HasDefaultValue(false);
                j.HasKey(t => new { t.ProjectId, t.EmployeeId });
                j.ToTable("EmployeeProject");
            });

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.AuthorTasks)
                .WithOne(e => e.AuthorTask)
                .HasForeignKey(e => e.AuthorTaskId).OnDelete(DeleteBehavior.SetNull);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.ContractorTasks)
                .WithOne(e => e.ContractorTask)
                .HasForeignKey(e => e.ContractorTaskId).OnDelete(DeleteBehavior.NoAction);

        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=DESKTOP-2DRF9EB\SQLEXPRESS;Database=ProjectDataBase;integrated security=True;MultipleActiveResultSets=True;TrustServerCertificate=Yes;");
        }
    }
}
