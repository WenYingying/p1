using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.HrDAL
{
    public class UpdateState : AbstractFactory.IFactory<Model.Hr>
    {
        public bool Parameter(Hr _obj)
        {
            return DataAccess.SqlAccess().ExecuteNonQuery(string.Format("UPDATE Hr SET State={0},LastUpdateTime=GETDATE() WHERE ID={1}",_obj.State,_obj.ID)) > 0;
        }

        public List<Hr> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<Hr> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
