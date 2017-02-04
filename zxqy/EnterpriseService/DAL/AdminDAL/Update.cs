using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.AdminDAL
{
    public class Update : AbstractFactory.IFactory<Model.Admin>
    {
        public bool Parameter(Admin _obj)
        {
            return DataAccess.SqlAccess().ExecuteNonQuery(SQL<Admin>.Update(_obj,string.Format(" AND ID={0}",_obj.ID))) > 0;
        }

        public List<Admin> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<Admin> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
