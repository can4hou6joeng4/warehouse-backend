package generator.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import generator.domain.Customer;
import generator.service.CustomerService;
import generator.mapper.CustomerMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【customer】的数据库操作Service实现
* @createDate 2023-11-27 15:35:24
*/
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer>
    implements CustomerService{

}




