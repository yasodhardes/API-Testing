using Bistec.ATF.Refit.Models;
using Refit;


namespace Bistec.ATF.APIs
{
    public interface IAuthApi
    {
        [Post("/admin")]
        Task<TokenResponse> CreateAdmin(CreateUserRequest request);
    }
}
