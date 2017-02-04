using System;
namespace Model
{

    /// <summary>
    /// 企业列表
    /// </summary>
    public class Enterprise
    {
        /// <summary>
        /// 企业编号
        /// </summary>
        public long? ID { set; get; }
        /// <summary>
        /// 企业名称
        /// </summary>
        public string CompanyName { set; get; }
        /// <summary>
        /// 公司介绍
        /// </summary>
        public string CompanyIntr { set; get; }
        /// <summary>
        /// 法定代表人
        /// </summary>
        public string LegalPerson { set; get; }
        /// <summary>
        /// 注册资本
        /// </summary>
        public string Capital { set; get; }
        /// <summary>
        /// 注册固定地址
        /// </summary>
        public string RegisterAddr { set; get; }
        /// <summary>
        /// 统一社会信用代码/注册号
        /// </summary>
        public string LicenseCode { set; get; }
        /// <summary>
        /// 营业执照照片
        /// </summary>
        public string LicensePic { set; get; }
        /// <summary>
        /// 项目名称
        /// </summary>
        public string ProjectName { set; get; }
        /// <summary>
        /// 项目介绍
        /// </summary>
        public string ProjectIntr { set; get; }
        /// <summary>
        /// 项目计划书路径
        /// </summary>
        public string ProjectPlan { set; get; }
        /// <summary>
        /// 状态,0=等待评审；1=审核通过；2=签约；3=工商手续；4=入驻成功;-1=评审失败;-2=签订协议失败;-3=营业执照审核失败
        /// </summary>
        public int? State { set; get; }
        /// <summary>
        /// 最后修改时间
        /// </summary>
        public string LastModifiedTime { set; get; }
        /// <summary>
        /// 入驻时间
        /// </summary>
        public string PostTime { set; get; }
        /// <summary>
        /// 企业成立日期
        /// </summary>
        public string CompanyRegTime { set; get; }
        /// <summary>
        /// 企业LOGO
        /// </summary>
        public string LogoPic { set; get; }
        /// <summary>
        /// 企业官网地址
        /// </summary>
        public string Url { set; get; }
        /// <summary>
        /// 企业联系电话
        /// </summary>
        public string Tel { set; get; }
        /// <summary>
        /// 审核意见
        /// </summary>
        public string Remark { set; get; }

    }
}