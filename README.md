## dlyk_server
本项目学习自[该视频](https://www.bilibili.com/video/BV1Fi4y1W7NZ/?spm_id_from=333.1007.top_right_bar_window_custom_collection.content.click&vd_source=45792527913efdcbf520573d0c16b421)，该仓库为总项目的前端项目，[前端项目](https://github.com/HUANGsir-JH/dlyk_front)  

## 技术栈
- springboot3 + mybatis + mysql + lombok
- springSecurity + jwt + redis
- pagehelper + EasyExcel
- aop

## 亮点
- 基于jwt进行token生成、redis存储、自定义过滤器实现登录管理
- 使用springSecurity进行的接口权限管理
- 使用aop进行数据库内容的访问控制，比如管理员可以查看所有，非管理员只可查看自己的数据
- 基于EasyExcel进行数据的excel导入的导出操作，与前端对接进行文件的上传与下载

## 收获
- 对于controller、service、mapper三层的熟练编写
- 对于基本的数据库操作的不断练习至熟练
- 对于aop如何在项目应用有了初步认知

## 写在最后
受限于时间和本科课程的压力（很多实验报告在追我），对于重复性较高的内容，没有完全编写。因此代码中存在一些未完成的部分。留待未来有时间进行完善
