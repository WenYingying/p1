using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.EnterpriseDAL
{
    public class UpdateState : AbstractFactory.IFactory<Model.Enterprise>
    {
        public bool Parameter(Model.Enterprise _obj)
        {
            return DataAccess.SqlAccess().ExecuteNonQuery(SQL<Model.Enterprise>.Update(_obj,string.Format(" AND ID={0}",_obj.ID))) > 0;
        }

        public List<Model.Enterprise> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<Model.Enterprise> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
