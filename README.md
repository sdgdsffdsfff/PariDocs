# 项目所用到的技术

1. Beanstalk/Rabbitmq  
1. MongoDB  
1. Redis  
1. PHP  
1. MariaDB    
1. Nginx  
1. varnish  
1. sphinx+scws/coreseek  
1. golang

# 工具下载
>http://pan.baidu.com/s/1gdtleAf  

# 描述(以下为以前所写好, 仅作参考)
---

##### [ Directory ]   
**docs** - 存储各类文档  
**env** - 环境配置文件   
**project** - 项目代码   
**schemas** - sql files
**misc** - statics files, like js css img
**test** - 测试 
  
##### [ Missions ]

1. **游戏系统 --- 萧**   
2. **会员系统, 推广系统 --- Tom**
3. **账户以及支付系统 --- ? **

##### [ 目录解析 ]
* docs - **存放各类文档**
   - requirements - **需求文档**
*  env - **环境配置文件**
   - conf.d  - **nginx配置文件**
*  misc - **statics files, like js css img**
*  project - **代码文件**
<!--   - ad - 广告系统 -->
   - **admin** - 后台管理系统
<!--      - analysis : 分析系统 , 主要用于行为分析, 分析是否有作弊行为 -->
   - **api** - 接口系统, 统一出入口, 包括对外服务以及Ajax请求都必须通过此接口进行调用. 为了更好的管理
   - **banker** - 庄家系统,包括庄家操盘管理,水位调整等等
   - cli - 命令行操作
   - **common** - 公有部分, 包括"配置","公共库","公共服务","组件" 等等
<!--      - defender - 防御, 未想好 -->
   - developer - 开发者系统, 后期引入开发者进行游戏开发
   - **games** - 游戏系统
   - **home** - 主站首页 
<!--      - member - 会员中心 -->
   - mobie - 手机版本, 这个可能会整合到www里面去做响应时
<!--      - monitor - 监控, 暂时不会做 -->
<!--      - oa - 客服办公系统, 包括对客户的处理操作, 交单给后台等等.
   - **sso** - 单点登录, 包括密码取回, 登录, 注册. 所有用户角色都必须在此系统操作都必须在此系统操作
   - **pay** - 支付以及账户管理系统 ,此系统比较大, 涉及比较多
<!--      - promo - 推广系统, CPM/CPC/CPA/CPR/CPS/CPT/PPC等推广联盟模式 -->
<!--      - security - 安全系统, 跨站等等 -->
   - vendor / service - 对外服务, 一些数据处理, 然后通通api对外进行服务
<!--      - statistics 统计报表系统 -->

* schemas 存放数据库结构文件


> **------ 粗体为第一期必做项目 ------**

##### [ 数据库设计原则 ]
1.所有表的表前缀必须根据功能来定, 以下为定义好的前缀:   
>
| PREFIX | NAME | TEXT |
|:---:|:-------------:|:--:|
| ad_ | advertisement | 广告 |
| adm_ | administrtor | 管理员 |
| art_ | article | 文章 |
| bk_ | banker | 庄家 |
| gm_ | games | 游戏 |
| mb_ | member | 会员 |
| pay_ | pay | 账户与支付|
| pm_ | promo | 推广 |
| sys_ | system | 系统 |
| sv_ | service | 对外服务 |   

> __*__以上仅作参考    

2.保留原型   
>无论用MongoDB开发或者Redis等NoSQL数据库开发都好, 必须保留一份设计原型, 也要在添加必要的设计说明, 如上的原型,必要时候保留ER图, 可以用MySQL Workbench进行设计,保留.sql或者.mwb文件.   

3.设计力求精简  
>就精简, 不要太多冗余

##### [ 代码设计原则 ]
1. 力求精简, 效率要高
2. 必须考虑安全问题,包括:  
   * 表单重复提交   
   * 跨站
   * SQL注入
   * 表单过滤
   * 伪造cookies等等
3. 做好注释, 每一个功能一个注释
4. 用phpdocumentor的文档写法, 使用   
   @todo   
   @var   
   @package  
   @property  
   @param   
   .....
5. 可能会用Zephire写一个公共库, 用于后期可扩展.








