using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.EnterpriseDAL
{
    public class Insert : AbstractFactory.IFactory<Model.Enterprise>
    {
        public bool Parameter(Enterprise _obj)
        {
            string sqltext = string.Format("INSERT INTO [dbo].[Enterprise]([CompanyName],[CompanyIntr],[LegalPerson],[RegisterAddr],[LicenseCode],[ProjectName],[ProjectIntr],[ProjectPlan])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')",!string.IsNullOrEmpty(_obj.CompanyName)? _obj.CompanyName.Replace("'","''"):"NULL",  !string.IsNullOrEmpty(_obj.CompanyIntr) ? _obj.CompanyIntr.Replace("'", "''"):"NULL", !string.IsNullOrEmpty(_obj.LegalPerson) ? _obj.LegalPerson.Replace("'", "''"):"NULL",  !string.IsNullOrEmpty(_obj.RegisterAddr) ? _obj.RegisterAddr.Replace("'", "''"):"NULL",  !string.IsNullOrEmpty(_obj.LicenseCode) ? _obj.LicenseCode.Replace("'", "''"):"NULL", _obj.ProjectName.Replace("'", "''"), _obj.ProjectIntr.Replace("'", "''"), _obj.ProjectPlan.Replace("'", "''"));
            if (DataAccess.SqlAccess().ExecuteNonQuery(sqltext) > 0)
            {
                _obj.ID = Convert.ToInt64(DataAccess.SqlAccess().ExecuteScalar("SELECT IDENT_CURRENT('Enterprise')"));
            }
            return _obj.ID > 0;
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
