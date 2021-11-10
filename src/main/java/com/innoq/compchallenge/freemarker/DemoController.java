package com.innoq.compchallenge.freemarker;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import freemarker.ext.beans.BeansWrapper;
import freemarker.template.Version;

@Controller
public class DemoController {
    
    @GetMapping("/")
	public String index(@ModelAttribute("model") ModelMap model) {
		BeansWrapper wrapper = new BeansWrapper(new Version(2,3,27));
		model.addAttribute("statics", wrapper.getStaticModels());
		return "index";
	}

}
