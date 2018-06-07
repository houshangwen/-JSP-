用户在本购物网站应能完成以下操作：
以下表示为：用户行为；网站行为

（1）注册：
    用户点击注册，出现需填写的表单，填写必要信息“用户名、登录密码、手机号码、收货地址、银行卡号”，选填信息“性别、生日、邮箱、关联QQ、关联微信、关联支付宝、头像上传”；网站为其生成一个内部唯一标示ID，将以上信息作为“一项”填入表users。

（2）登录：
    用户在指定位置输入“用户名/手机号”点击登录，或使用QQ/微信授权登录（走形式）；数据库判断users表中 （用户名=*** or 手机号=****） and 密码=****（这里的密码可以考虑撒盐哈希处理），匹配失败返回提醒，否则登录成功（原登录位置展示用户名、头像等信息）

（3）商品关键字检索：
    用户在搜索框中输入字符，点击搜索（无论是否登录）；网站将该字符串进行预处理（防止攻击，可不做），将字符串与goods表中的“商品名、商品介绍”部分进行子串匹配，返回匹配成功的那些表项，在搜索框下方依网页模板的次序排列，仅展示“商品图片、商品名称、商品单价、库存、销量”。

（4）从链接进入某商品页，将商品加入购物车：
用户点击某样商品的链接（图片、名称）进入详细页面，可以查看商品详细介绍，选择购买数量，点击加入购物车（若未登录则提示登录）；链接中应包含“商品唯一标示ID”，网站为其生成对应的展示页面（使用模板），展示内容见商品属性，用户点击加入购物车后，数据库查看User-Cart表，首先判断该用户对应表项中，C_ID是否为空，空时为其生成唯一标示ID。此外数据库还需修改cart-goods表，插入“Cart_ID，Good_ID，Good_Name,Num，Price”这样的一行或数行。

（5）进入购物车结账：
用户点击购物车图标进入购物车，点击结账（可留下备注），选择支付方式（空壳），点击支付；网站提取cart表中所有该用户ID(group by)的表项，将内容组织到网页模板中。用户点击结账，数据库为用户生成订单，在User-Order表中插入“User_ID,Order_ID”表项，在orders表中为这个新的Order_Id生成一行，内容见订单属性。

（6）浏览商品：
根据模板支持的情况，不做大的改动。

（7）其他
本系统在暂不考虑用户付款后的行为。
