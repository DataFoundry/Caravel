# 使用airbnb caravel进行数据可视化

###  构建并运行caravel
```
oc new-app https://github.com/datafoundry/caravel.git
oc expose svc caravel
```

### 运行mysql
```
oc run mysql \
--image registry.dataos.io/library/mysql \
--env MYSQL_ALLOW_EMPTY_PASSWORD='yes' \
--env MYSQL_DATABASE=demo 
oc expose dc mysql --port=3306
```

###  绑定caravel到mysql
```
oc env dc/caravel DBBSI=MYSQL BSI_MYSQL_URI=mysql://mysql:3306/demo
```
### 开放caravel内部服务端口和外部域名 
oc expose dc caravel --port 8088
oc expose svc caravel
### 使用浏览器查看数据
登陆caravel route地址(通过oc get route查看这个地址)  
数据用户名密码：admin/caravel_admin


