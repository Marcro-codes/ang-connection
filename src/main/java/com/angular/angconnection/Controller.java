package com.angular.angconnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class Controller {

    @Autowired UserRepo userRepo;

    @PostMapping("post")
    public String add(@RequestBody Model dto) {
        Model model = new Model();
        model.setName(dto.getName());
        model.setPhone(dto.getPhone());
        userRepo.save(model);
        return "successfully added";
    }

    @GetMapping("get")
    public List<Model> get(){
        return userRepo.findAll();
    }

    @DeleteMapping("all")
    public String delete(){
        userRepo.deleteAll();
        return " successfully deleted";
    }

}
