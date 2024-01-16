using Dapper;
using Poc.Application.Interfaces;
using Poc.Core.Entities;
using Poc.Core.Shared;
using Poc.Infrastructure.Data;
using System.Data;

namespace Poc.Infrastructure.Repositories
{
    public class DepartmentRepository : IDepartmentRepository
    {
        private readonly DapperContext dapperContext;
        public DepartmentRepository(DapperContext dapperContext)
        {
            this.dapperContext = dapperContext;
        }

        public async Task<Result> DeleteAsync(int Id)
        {
            using (var connection = dapperContext.CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("Id", Id);
                var result = await connection.ExecuteAsync("sp_DeleteDepartment", parameters,
                                 commandType: CommandType.StoredProcedure);

                if (result > 0) return Result.Success(null, "Department Deleted");
            }

            return Result.Failure(new Error(
                         "Department.DeleteFailled", "Delete Failled"));
        }

        public async Task<Result> GetDepartments()
        {
            using (var connection = dapperContext.CreateConnection())
            {
                var departMents = await connection.QueryAsync<Department>("sp_GetDepartments",
                                 commandType: CommandType.StoredProcedure);

                if (departMents != null) return Result.Success(departMents);
            }

            return Result.Failure(new Error(
                         "Department.NotFound", "No records found"));
        }

        public async Task<Result> InsertAsync(Department department)
        {
            using (var connection = dapperContext.CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("Name", department.Name);

                var result = await connection.ExecuteAsync("sp_InsertDepartment", parameters,
                                 commandType: CommandType.StoredProcedure);

                if (result > 0) return Result.Success(null, "Department Added Successfully");
            }

            return Result.Failure(new Error(
                         "Department.AddFailled", "Insert Failled"));
        }

        public async Task<Result> UpdateAsync(Department department)
        {
            using (var connection = dapperContext.CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("Id", department.Id);
                parameters.Add("Name", department.Name);
                var result = await connection.ExecuteAsync("sp_UpdateDepartment", parameters,
                                 commandType: CommandType.StoredProcedure);

                if (result > 0) return Result.Success(null, "Department Updated Successfully");
            }

            return Result.Failure(new Error(
                         "Department.UpdateFailled", "Update Failled"));
        }

        public async Task<Result> GetDepartmentById(int Id)
        {
            using (var connection = dapperContext.CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("Id", Id);
                var department = await connection.QueryAsync<Department>("sp_GetDepartmentById", parameters,
                                 commandType: CommandType.StoredProcedure);

                if (department != null) return Result.Success(department);
            }

            return Result.Failure(new Error(
                         "Department.NotDound", "Department Not Found"));
        }
    }
}
