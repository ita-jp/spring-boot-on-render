package com.example.sample.controller;

import com.example.sample.repository.SampleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class IndexController {

    private final SampleRepository repository;

    @GetMapping
    public String index(Model model) {
        repository.insert();
        model.addAttribute("logs", repository.select());
        return "index";
    }
}
