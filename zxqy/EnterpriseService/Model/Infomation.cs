using System;
namespace Model
{

    /// <summary>
    /// 信息内容
    /// </summary>
    public class Information
    {
        /// <summary>
        /// 信息编号
        /// </summary>
        public long? ID { set; get; }
        /// <summary>
        /// 信息标题
        /// </summary>
        public string Title { set; get; }
        /// <summary>
        /// 信息类别：NEWS/NOTICE/INDUSTRY/POLICY/KNOWLAGE等
        /// </summary>
        public string Type { set; get; }
        /// <summary>
        /// 信息标签：大类别下的子类，自定义，用","分割
        /// </summary>
        public string Tags { set; get; }
        /// <summary>
        /// 信息内容
        /// </summary>
        public string Content { set; get; }
        /// <summary>
        /// 企业用户编号，若空即为平台发布
        /// </summary>
        public long? UserId { set; get; }
        /// <summary>
        /// 管理员编号
        /// </summary>
        public int? AdminId { set; get; }
        /// <summary>
        /// 企业编号
        /// </summary>
        public long? EnterpriseId { set; get; }
        /// <summary>
        /// 状态，默认为：0=未审核，-1=拒发布，1=发布，2=企业内部推荐，3=平台推荐
        /// </summary>
        public int? State { set; get; }
        /// <summary>
        /// 发布时间
        /// </summary>
        public string PostTime { set; get; }
        /// <summary>
        /// 新闻封面图
        /// </summary>
        public string CoverPic { set; get; }
        /// <summary>
        /// 所属企业名称
        /// </summary>
        public string CompanyName { set; get; }
    }
}

