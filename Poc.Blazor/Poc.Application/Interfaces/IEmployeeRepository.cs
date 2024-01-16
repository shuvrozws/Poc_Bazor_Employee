using Poc.Core.Entities;
using Poc.Core.Shared;

namespace Poc.Application.Interfaces
{
    public interface IEmployeeRepository
    {
       Task<Result> GetEmployees();
       Task<Result> InsertAsync(Employee employee);
       Task<Result> UpdateAsync(Employee employee);
       Task<Result> DeleteAsync(int Id);
        Task<Result> GetEmployeeById(int Id);
    }
}
