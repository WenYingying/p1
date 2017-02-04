using System;
namespace Model{

	/// <summary>
	/// 企业用户管理员
	/// </summary>
	public class EnterpriseUser{
		/// <summary>
		/// 用户编号
		/// </summary>
		public long? ID{set;get;}
		/// <summary>
		/// 企业编号
		/// </summary>
		public long? EnterpriseId{set;get;}
		/// <summary>
		/// 手机号码
		/// </summary>
		public string Mobile{set;get;}
		/// <summary>
		/// 姓名
		/// </summary>
		public string Name{set;get;}
		/// <summary>
		/// 登录密码
		/// </summary>
		public string Password{set;get;}
		/// <summary>
		/// 用户权限,all=全部权限；链接用“|”分隔
		/// </summary>
		public string Permission{set;get;}
		/// <summary>
		/// 岗位
		/// </summary>
		public string Post{set;get;}
		/// <summary>
		/// 最后登录IP
		/// </summary>
		public string LastLoginIp{set;get;}
		/// <summary>
		/// 最后登录时间
		/// </summary>
		public string LastLoginTime{set;get;}
		/// <summary>
		/// 创建时间
		/// </summary>
		public string CreateTime{set;get;}
        /// <summary>
        /// 所属企业的状态
        /// </summary>
        public int? EnterpriseState { set; get; }
        /// <summary>
        /// 所属企业名称
        /// </summary>
        public string CompanyName { set; get; }
    }
}
