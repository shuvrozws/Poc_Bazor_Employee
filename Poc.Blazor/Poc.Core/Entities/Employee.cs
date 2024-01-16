using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Poc.Core.Entities
{
    public class Employee
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; } = string.Empty;
        public string DepartmentName { get; set; } = string.Empty;
        [Required]
        public int? DepartmentId { get; set; }
        [Required]
        public DateTime? DateOfBirth { get; set; }


    }

}
