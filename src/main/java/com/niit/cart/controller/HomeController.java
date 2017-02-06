package com.niit.cart.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

//import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.CartBackEnd.dao.CategoryDAO;
import com.niit.CartBackEnd.dao.ProductDAO;
import com.niit.CartBackEnd.dao.SupplierDAO;
import com.niit.CartBackEnd.dao.UserDAO;
import com.niit.CartBackEnd.daoimpl.SupplierDAOImpl;
import com.niit.CartBackEnd.model.Category;
import com.niit.CartBackEnd.model.Product;
import com.niit.CartBackEnd.model.Supplier;
import com.niit.CartBackEnd.model.User;

@Controller
public class HomeController {
Logger log=LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private UserDAO userDAO;
	@Autowired
	User user;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private Category category;
	@Autowired
	private SupplierDAO supplierDAO;
	@Autowired
	private Supplier supplier;
	@Autowired
	private Product product;
	@Autowired
	private ProductDAO productDAO;

	@RequestMapping("/")
	public ModelAndView homepage(HttpSession session) {
		log.debug("Starting of  the method home page.......H.......!");
		System.out.println("method is executed");
		session.setAttribute("Category", category);
		session.setAttribute("Product", product);
		session.setAttribute("supplier",supplier);
		session.setAttribute("CategoryList", categoryDAO.list());
	    session.setAttribute("SupplierList", supplierDAO.list());
	    session.setAttribute("ProductList",productDAO.list());
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("Clickedcartproduct", "true");
		log.debug("Starting of  the method home page.......H.......!");
		return mv;
	}

	@RequestMapping("/login")
	public ModelAndView showLoginpage() {
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("user",user);
		mv.addObject("UserClickedLogin", "true");
		return mv;
	}

	@RequestMapping("/registration")
	public ModelAndView showRegisterpage() {
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("user",user);
		mv.addObject("showregistionpage", "true");
		return mv;
	}
	
	  @RequestMapping(value ="ShowProduct/{id}" )
	    public String ShowProduct(@PathVariable("id") int id,RedirectAttributes attributes,Model m) {
	        m.addAttribute("UserClickedshowproduct", "true");
	    	m.addAttribute("IndividualProduct", productDAO.getproduct(id));
	    	return "ShowProduct";
	    }
	@RequestMapping(value="navproducts/{id}")
	public String navproduct(Model m,@PathVariable("id") int id,RedirectAttributes attributes ){
		/*m.addAttribute("Clickedcatproduct", "true");*/
		attributes.addFlashAttribute("navproducts", productDAO.navproduct(id));
		return "redirect:/";
	}
	
}
