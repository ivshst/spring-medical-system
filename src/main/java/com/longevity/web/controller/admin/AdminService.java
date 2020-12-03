package com.longevity.web.controller.admin;

import com.longevity.web.domain.services.Services;
import com.longevity.web.domain.users.Employee;
import com.longevity.web.service.services.ServicesService;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin/service")
public class AdminService {
    private ServicesService servicesService;

    public AdminService(ServicesService servicesService) {
        this.servicesService = servicesService;
    }

    @GetMapping("all")
    public String getAllService(Model model){
        //model.addAttribute("services", servicesService.getAllServices());
        //return "admin/service/services";
        return findPaginatedServices(1, model);
    }

    @GetMapping("{id}")
    public String getServiceId(@PathVariable(name = "id") Services service, Model model ){
        model.addAttribute("service", service);
        return "admin/service/service";
    }

    @PostMapping("add")
    public String addService(
            @RequestParam(name = "name") String name,
            @RequestParam(name = "price")String price
    ){
        servicesService.addService(name, Double.parseDouble(price.replace(",",".")));
        return "redirect:/admin/service/all";
    }

    @PostMapping("{id}/update")
    public String updateService(
            @PathVariable(name = "id") Services service,
            @RequestParam(name = "name") String name,
            @RequestParam(name = "price") String price
    ){
        servicesService.updateService(service, name, Double.parseDouble(price.replace(",",".")));
        return "redirect:/admin/service/"+service.getId();
    }

    @GetMapping("{id}/delete")
    public String deleteServiceById(@PathVariable(name = "id") Services service){
        servicesService.deleteService(service);
        return "redirect:/admin/service/all";
    }

    @GetMapping("/all/pageus/{pageNo}")
    public String findPaginatedServices(@PathVariable("pageNo") int pageNo, Model model) {
        int pageSize = 5;

        Page<Services> page = servicesService.findPaginate(pageNo, pageSize);

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("services", page.getContent());

        return "admin/service/services";
    }

}
