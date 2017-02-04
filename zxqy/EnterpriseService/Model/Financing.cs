using System;
namespace Model
{

    /// <summary>
    /// 融资表
    /// </summary>
    public class Financing
    {
        /// <summary>
        /// 融资编号
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
        /// 融资阶段
        /// </summary>
        public string Stage { set; get; }
        /// <summary>
        /// 联系电话
        /// </summary>
        public string Mobile { set; get; }
        /// <summary>
        /// 融资规模
        /// </summary>
        public int? Money { set; get; }
        /// <summary>
        /// 出让股权
        /// </summary>
        public string Stock { set; get; }
        /// <summary>
        /// 预期收益
        /// </summary>
        public string Profit { set; get; }
        /// <summary>
        /// 融资说明
        /// </summary>
        public string Detail { set; get; }
        /// <summary>
        /// 状态:0=待审核，-1=拒绝发布，1=发布中
        /// </summary>
        public int? State { set; get; }
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
    }
}

