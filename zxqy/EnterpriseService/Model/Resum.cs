using System;
namespace Model
{

    /// <summary>
    /// 简历表
    /// </summary>
    public class Resum
    {
        /// <summary>
        /// 简历编号
        /// </summary>
        public long? ID { set; get; }
        /// <summary>
        /// 应聘岗位编号
        /// </summary>
        public long? HrId { set; get; }
        /// <summary>
        /// 姓名
        /// </summary>
        public string Name { set; get; }
        /// <summary>
        /// 生日
        /// </summary>
        public string BirthDay { set; get; }
        /// <summary>
        /// 手机号
        /// </summary>
        public string Mobile { set; get; }
        /// <summary>
        /// 工作年限
        /// </summary>
        public int? WorkYears { set; get; }
        /// <summary>
        /// 学历
        /// </summary>
        public string Degree { set; get; }
        /// <summary>
        /// 居住地址
        /// </summary>
        public string Addr { set; get; }
        /// <summary>
        /// 求职信或自我介绍
        /// </summary>
        public string Introduce { set; get; }
        /// <summary>
        /// 附件简历
        /// </summary>
        public string OfflinePath { set; get; }
        /// <summary>
        /// 应聘状态
        /// </summary>
        public int State { set; get; }
        /// <summary>
        /// 投递时间
        /// </summary>
        public string PostTime { set; get; }
        /// <summary>
        /// 应聘职位
		/// </summary>
		public string PositionName { set; get; }
        /// <summary>
        /// 用人企业名称
        /// </summary>
        public string CompanyName { set; get; }
        /// <summary>
        /// 用人企业ID
        /// </summary>
        public long? EnterpriseId { set; get; }
    }
}

