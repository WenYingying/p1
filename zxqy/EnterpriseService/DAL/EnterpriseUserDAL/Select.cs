using System;
using System.Collections.Generic;
using AbstractFactory;
using Model;
using System.Data.SqlClient;
using System.Reflection;

namespace DAL.EnterpriseUserDAL
{
	public class Select:IFactory<EnterpriseUser>
	{
		#region IFactory<EnterpriseUser> 成员

		public bool Parameter(EnterpriseUser _EnterpriseUser)
		{
			throw new NotImplementedException();
		}

		public List<EnterpriseUser> Parameter(string select_list, string select_search)
		{
			string sqltext = string.Format("SELECT {0} FROM View_EnterpriseUser WHERE 1=1 {1}", select_list, select_search);
			List<EnterpriseUser> list = new List<EnterpriseUser>();
			using (SqlDataReader dr = DataAccess.SqlAccess().ExecuteReader(sqltext))
			{
				Type t = typeof(EnterpriseUser);
				while (dr.Read())
				{
					EnterpriseUser _obj = new EnterpriseUser();
					for (int i = 0; i < dr.FieldCount; i++)
					{
						if (object.Equals(DBNull.Value, dr[i]))
							continue;
						PropertyInfo pi = t.GetProperty(dr.GetName(i));
                        if (pi.PropertyType.IsGenericType && pi.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>))
                        {
                            pi.SetValue(_obj, Convert.ChangeType(dr[i], new System.ComponentModel.NullableConverter(pi.PropertyType).UnderlyingType));
                            continue;
                        }
                        pi.SetValue(_obj, Convert.ChangeType(dr[i], pi.PropertyType), null);
					}

					list.Add(_obj);
				}
			}

			return list;
		}

		public List<EnterpriseUser> Parameter(string select_list, string select_search, string select_order, int PageIndex, int PageSize, ref int PageCount, ref int TotalCnt)
		{
			throw new NotImplementedException();
		}

		#endregion
	}
}