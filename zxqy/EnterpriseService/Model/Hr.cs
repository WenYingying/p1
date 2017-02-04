using System;
namespace Model
{

    /// <summary>
    /// 招聘信息表
    /// </summary>
    public class Hr
    {
        /// <summary>
        /// 信息编号
        /// </summary>
        public long? ID { set; get; }
        /// <summary>
        /// 企业编号
        /// </summary>
        public long? EnterpriseId { set; get; }
        /// <summary>
        /// 企业用户编号，若空即为平台发布
        /// </summary>
        public long? UserId { set; get; }
        /// <summary>
        /// 职位名称
        /// </summary>
        public string PositionName { set; get; }
        /// <summary>
        /// 最低学历
        /// </summary>
        public string Degree { set; get; }
        /// <summary>
        /// 所属行业
        /// </summary>
        public string Trade { set; get; }
        /// <summary>
        /// 所属部门
        /// </summary>
        public string Depart { set; get; }
        /// <summary>
        /// 薪资范围
        /// </summary>
        public string Salary { set; get; }
        /// <summary>
        /// 专业要求
        /// </summary>
        public string Major { set; get; }
        /// <summary>
        /// 福利
        /// </summary>
        public string Welfare { set; get; }
        /// <summary>
        /// 岗位描述与岗位要求
        /// </summary>
        public string Detail { set; get; }
        /// <summary>
        /// 职位招聘状态,0=暂停/停止招聘；1=招聘中；2=顶置职位
        /// </summary>
        public int? State { set; get; }
        /// <summary>
        /// 最后发布时间
        /// </summary>
        public string LastUpdateTime { set; get; }
        /// <summary>
        /// 发布时间
        /// </summary>
        public string PostTime { set; get; }
        /// <summary>
        /// 企业LOGO
        /// </summary>
        public string LogoPic { set; get; }
        /// <summary>
        /// 企业名称
        /// </summary>
        public string CompanyName { set; get; }
        /// <summary>
        /// 企业简介
        /// </summary>
        public string CompanyIntr { set; get; }
        /// <summary>
        /// 项目名称
        /// </summary>
        public string ProjectName { set; get; }
        /// <summary>
        /// 项目介绍
        /// </summary>
        public string ProjectIntr { set; get; }
        /// <summary>
        /// 地址
        /// </summary>
        public string RegisterAddr { set; get; }
    }
}

