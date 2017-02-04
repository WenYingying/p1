using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
using System.Data.SqlClient;

namespace DAL.ResumDAL
{
    public class Pager : AbstractFactory.IFactory<Model.Resum>
    {
        public bool Parameter(Resum _obj)
        {
            throw new NotImplementedException();
        }

        public List<Resum> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<Resum> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            string sqlCmdText = "Pager";
            List<System.Data.SqlClient.SqlParameter> Params = new List<System.Data.SqlClient.SqlParameter>();
            System.Data.SqlClient.SqlParameter item = new System.Data.SqlClient.SqlParameter
            {
                ParameterName = "@PageCount",
                SqlDbType = SqlDbType.Int,
                Direction = ParameterDirection.Output
            };
            Params.Add(item);
            SqlParameter p = new SqlParameter
            {
                ParameterName = "@Cnt",
                SqlDbType = SqlDbType.Int,
                Direction = ParameterDirection.Output
            };
            Params.Add(p);
            Params.Add(new SqlParameter("@WhichTable", "View_Resum"));
            Params.Add(new SqlParameter("@KeyCol", "ID"));
            Params.Add(new SqlParameter("@Col", select_list));
            Params.Add(new SqlParameter("@SearchStr", select_search));
            Params.Add(new SqlParameter("@OrderStr", select_order));
            Params.Add(new SqlParameter("@PageNo", pageno));
            Params.Add(new SqlParameter("@PageSize", pagesize));
            DataSet dataSet = DataAccess.SqlAccess().GetDataSet(sqlCmdText, Params.ToArray());
            pagecount = Convert.ToInt32(item.Value);
            recordcount = Convert.ToInt32(p.Value);
            List<Resum> list = new List<Resum>();
            foreach (DataRow row in dataSet.Tables[0].Rows)
            {
                Resum _obj = new Resum();
                Type type = _obj.GetType();
                foreach (DataColumn column in row.Table.Columns)
                {
                    if (!object.Equals(DBNull.Value, row[column.ColumnName]))
                    {
                        System.Reflection.PropertyInfo pi = type.GetProperty(column.ColumnName);
                        if (pi.PropertyType.IsGenericType && pi.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>))
                        {
                           pi.SetValue(_obj, Convert.ChangeType(row[column.ColumnName], new System.ComponentModel.NullableConverter(pi.PropertyType).UnderlyingType));
                            continue;
                        }
                        pi.SetValue(_obj, Convert.ChangeType(row[column.ColumnName], pi.PropertyType));
                    }
                }
                list.Add(_obj);
            }
            return list;
        }
    }
}
