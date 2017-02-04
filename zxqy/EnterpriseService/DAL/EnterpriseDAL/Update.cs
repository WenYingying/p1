using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.EnterpriseDAL
{
    public class Update : AbstractFactory.IFactory<Model.Enterprise>
    {
        public bool Parameter(Enterprise _obj)
        {
            string sqltext = string.Format("UPDATE [dbo].[Enterprise]  SET [CompanyName] = '{0}',[CompanyIntr] = '{1}',[LegalPerson] = '{2}',[Capital] = '{3}',[RegisterAddr] = '{4}',[LicenseCode] = '{5}',[LicensePic] = '{6}',[ProjectName] = '{7}',[ProjectIntr] = '{8}',[ProjectPlan] = '{9}',[LastModifiedTime] = GETDATE(),[CompanyRegTime] = '{10}',[LogoPic] = '{11}',[Url] = '{12}',[Tel] = '{13}' WHERE ID = '{14}'", _obj.CompanyName.Replace("'", "''"), _obj.CompanyIntr.Replace("'", "''"), _obj.LegalPerson.Replace("'", "''"), _obj.Capital.Replace("'", "''"), _obj.RegisterAddr.Replace("'", "''"), _obj.LicenseCode.Replace("'", "''"), _obj.LicensePic.Replace("'", "''"), _obj.ProjectName.Replace("'", "''"), _obj.ProjectIntr.Replace("'", "''"), _obj.ProjectPlan.Replace("'", "''"), _obj.CompanyRegTime.Replace("'", "''"), _obj.LogoPic.Replace("'", "''"), _obj.Url.Replace("'", "''"), _obj.Tel.Replace("'", "''"), _obj.ID);
            return DataAccess.SqlAccess().ExecuteNonQuery(sqltext) > 0;
        }

        public List<Enterprise> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<Enterprise> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
