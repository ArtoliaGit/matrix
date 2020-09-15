package com.bsoft.template.configuration;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.BlockAttackInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.OptimisticLockerInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * mybatis-plus配置
 *
 * @author artolia
 */
@Configuration
@MapperScan("com.bsoft.template.mapper")
public class MybatisPlusConfiguration {

    /**
     * 启用插件
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();

        // 分页插件 设置数据库类型
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));

        // 乐观锁插件
        interceptor.addInnerInterceptor(new OptimisticLockerInnerInterceptor());

        // 防止全表更新与删除插件
        interceptor.addInnerInterceptor(new BlockAttackInnerInterceptor());

        return interceptor;
    }

}
