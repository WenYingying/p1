using System;
namespace Model
{

    /// <summary>
    /// 平台管理员
    /// </summary>
    public class Admin
    {
        /// <summary>
        /// 管理员编号
        /// </summary>
        public int? ID { set; get; }
        /// <summary>
        /// 登录名
        /// </summary>
        public string LoginName { set; get; }
        /// <summary>
        /// 登录密码
        /// </summary>
        public string Password { set; get; }
        /// <summary>
        /// 邮箱
        /// </summary>
        public string Email { set; get; }
        /// <summary>
        /// 姓名
        /// </summary>
        public string Name { set; get; }
        /// <summary>
        /// 性别，1=男，0=女
        /// </summary>
        public int? Gender { set; get; }
        /// <summary>
        /// 职位
        /// </summary>
        public string Position { set; get; }
        /// <summary>
        /// 手机号码
        /// </summary>
        public string Mobile { set; get; }
        /// <summary>
        /// 最后登录时间
        /// </summary>
        public string LastLoginTime { set; get; }
        /// <summary>
        /// 最后登录IP
        /// </summary>
        public string LastLoginIp { set; get; }
        /// <summary>
        /// 注册时间
        /// </summary>
        public string PostTime { set; get; }
    }
}

