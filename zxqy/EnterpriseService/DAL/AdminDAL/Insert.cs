using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.AdminDAL
{
    public class Insert : AbstractFactory.IFactory<Model.Admin>
    {
        public bool Parameter(Admin _obj)
        {
            return DataAccess.SqlAccess().ExecuteNonQuery(SQL<Admin>.Insert(_obj)) > 0;
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
