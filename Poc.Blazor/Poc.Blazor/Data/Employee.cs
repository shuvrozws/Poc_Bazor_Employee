 namespace Poc.Blazor.Data
{
    public class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string DepartmentName { get; set; } = string.Empty;
        public int DepartmentId { get; set; }
        public DateTime? DateOfBirth { get; set; }


    }
}
