using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.EnterpriseUserDAL
{
    public class Insert : AbstractFactory.IFactory<Model.EnterpriseUser>
    {
        public bool Parameter(EnterpriseUser _obj)
        {
            string sqltext = string.Format("INSERT INTO [dbo].[EnterpriseUser]([EnterpriseID],[Mobile],[Name],[Password],[Permission],[Post])VALUES('{0}','{1}','{2}','{3}','{4}','{5}')", _obj.EnterpriseId, _obj.Mobile.Replace("'", "''"), _obj.Name.Replace("'", "''"), _obj.Password.Replace("'", "''"), _obj.Permission.Replace("'", "''"), _obj.Post.Replace("'", "''"));
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
