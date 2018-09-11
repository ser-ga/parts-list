package org.mycompany.myname.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.mycompany.myname.dao.PartDao;
import org.mycompany.myname.dao.PartDaoImpl;
import org.mycompany.myname.service.PartService;
import org.mycompany.myname.service.PartServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * @author Sergey Zhukov
 * @version 1.0
 */

@Configuration
@EnableWebMvc
@ComponentScan({"org.mycompany.myname"})
@EnableTransactionManagement
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addViewControllers(final ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("index");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/webjars/**").addResourceLocations("/webjars/");
        registry.addResourceHandler("/**").addResourceLocations("/resources/");
    }

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/pages/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        String[] scan = new String[]{"org.mycompany.myname.model"};
        sessionFactory.setPackagesToScan(scan);
        sessionFactory.setHibernateProperties(hibernateProperties());

        return sessionFactory;
    }

    @Bean
    public DataSource dataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("root");

        return dataSource;
    }

    @Bean
    public HibernateTransactionManager hibernateTransactionManager() {
        HibernateTransactionManager tm = new HibernateTransactionManager();
        tm.setSessionFactory(sessionFactory().getObject());

        return tm;
    }

    @Bean
    public PartService partService(){
        PartServiceImpl partService = new PartServiceImpl();
        partService.setPartDao(partDao());

        return partService;
    }

    @Bean
    public PartDao partDao(){
        PartDaoImpl partDao = new PartDaoImpl();
        partDao.setSessionFactory(sessionFactory().getObject());

        return partDao;
    }

    private final Properties hibernateProperties() {
        Properties hp = new Properties();
        hp.setProperty("hibernate.hbm2ddl.auto", "validate");
        hp.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        hp.setProperty("hibernate.show_sql", "true");

        return hp;
    }

}

