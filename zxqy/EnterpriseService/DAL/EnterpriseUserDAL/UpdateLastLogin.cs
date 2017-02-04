using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.EnterpriseUserDAL
{
    public class UpdateLastLogin : AbstractFactory.IFactory<Model.EnterpriseUser>
    {
        public bool Parameter(EnterpriseUser _obj)
        {
            string sqltext = string.Format("UPDATE EnterpriseUser SET LastLoginTime=GETDATE(),LastLoginIp='{0}' WHERE ID={1}", _obj.LastLoginIp.Replace("'", "''"), _obj.ID);
            return DataAccess.SqlAccess().ExecuteNonQuery(sqltext) > 0;
        }

        public List<EnterpriseUser> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<EnterpriseUser> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
