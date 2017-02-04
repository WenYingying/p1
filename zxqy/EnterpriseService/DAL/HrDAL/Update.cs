using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.HrDAL
{
    public class Update : AbstractFactory.IFactory<Model.Hr>
    {
        public bool Parameter(Hr _obj)
        {
            string sqltext = string.Format("UPDATE [dbo].[Hr] SET [PositionName]='{0}',[Degree]='{1}',[Trade]='{2}' ,[Depart]='{3}' ,[Salary]='{4}' ,[Major]='{5}' ,[Welfare]='{6}' ,[Detail]='{7}',LastUpdateTime=GETDATE() WHERE ID={8}", _obj.PositionName.Replace("'", "''"), _obj.Degree.Replace("'", "''"), _obj.Trade.Replace("'", "''"), _obj.Depart.Replace("'", "''"), _obj.Salary.Replace("'", "''"), _obj.Major.Replace("'", "''"), _obj.Welfare.Replace("'", "''"), _obj.Detail.Replace("'", "''"), _obj.ID);
            return DataAccess.SqlAccess().ExecuteNonQuery(sqltext) > 0;
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
