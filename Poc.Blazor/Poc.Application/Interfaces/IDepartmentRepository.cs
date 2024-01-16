using Poc.Core.Entities;
using Poc.Core.Shared;

namespace Poc.Application.Interfaces
{
    public interface IDepartmentRepository
    {
        Task<Result> GetDepartments();
        Task<Result> InsertAsync(Department department);
        Task<Result> UpdateAsync(Department department);
        Task<Result> DeleteAsync(int Id);
        Task<Result> GetDepartmentById(int Id);
    }
}
