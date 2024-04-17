using System.Security.Cryptography;
using System.Text;

namespace ProjectManagementSystem.Models
{
    public static class Hash
    {
        public static string GetHashPAssword(string Password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] sourceBytePassword = Encoding.UTF8.GetBytes(Password);
                byte[] hashSourceBytePassword = sha256.ComputeHash(sourceBytePassword);
                string hashPassword = BitConverter.ToString(hashSourceBytePassword).Replace("-", String.Empty);
                return hashPassword;
            }
        }
    }
}
