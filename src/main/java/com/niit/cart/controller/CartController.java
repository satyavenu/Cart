package com.niit.cart.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.CartBackEnd.dao.CartDAO;
import com.niit.CartBackEnd.dao.CategoryDAO;
import com.niit.CartBackEnd.dao.ProductDAO;
import com.niit.CartBackEnd.model.Cart;
import com.niit.CartBackEnd.model.Product;

@Controller
public class CartController {


	@Autowired
	 private CartDAO cartDAO;
	@Autowired
	 private CategoryDAO categoryDAO;
	 @Autowired
	 private ProductDAO productDAO;
	 
	 public static final Logger log=LoggerFactory.getLogger(CartController.class);
/*	 
@RequestMapping(value="/Cart1")
	 public ModelAndView Cartpage(HttpSession session)
	 {
	  ModelAndView  mv=new ModelAndView("home");
	  mv.addObject("UserClickedCart","true");
	  mv.addObject("categoryList", categoryDAO.list());
	  return mv;
	  
	 }*/
	 int q;
	 
	 @RequestMapping(value={"addtocart/{id}","navproducts/addtocart/{id}","addtocart/{userid}/{id}"})
	 public String addTOCart(@ModelAttribute("cart")Cart cart,BindingResult result,@PathVariable("userid") int userid,@PathVariable("id") int productid,HttpSession session)throws Exception{
	 
	  log.info("Cart operation start");
	  long p;
	  if(cartDAO.getproduct(productid,userid)==null){
	   Cart cart2= new Cart(); 
	   Product product = productDAO.get(productid);
	   cart2.setProductid(product.getId());
	   cart2.setProductname(product.getName());
	   cart2.setPrice(product.getPrice());
	   cart2.setQuantity(1);
	   q=cart2.getQuantity();
	   cart2.setStatus("C");
	   cart2.setUserid(userid);
	 // cart2.setUserid(((int) session.getAttribute("userid"));
	   	   cartDAO.saveorupdate(cart2);
	   	session.setAttribute("cartsize", cartDAO.Cartsize( (Integer) session.getAttribute("userid")));
	  System.out.println("save sucessfully..............................!");
	            return "redirect:/cart";
	  }else{
	   Cart cart1 = cartDAO.getproduct(productid,userid);
	   Product product1 = productDAO.get(productid);
	   q=cart1.getQuantity();
	   cart1.setStatus("C");
	   /*cart1.setUserid((int) session.getAttribute("userid"));*/
	   p=product1.getPrice();
	   q+=1;
	   p=q*p;
	 cart1.setQuantity(q);
	 cart1.setPrice(p);
	// cart1.setUserid(userid);
	cartDAO.saveorupdate(cart1);
	session.setAttribute("cartsize", cartDAO.Cartsize( (Integer) session.getAttribute("userid")));
	System.out.println("opeartion over");

	log.info("cart operaiton over");
	return "redirect:/cart";
	  } 
	  
	 }
	 
	 
	 @RequestMapping(value="update/{id}")
		public String update(@ModelAttribute("cart") Cart cart){
			cartDAO.update(cart);
			return "redirect:/cart";
		}
	 @RequestMapping(value="delete/{id}")
	 public String delete(@ModelAttribute("cart") Cart cart,HttpSession session){
	  cartDAO.delete(cart);
	  session.setAttribute("cartsize", cartDAO.Cartsize( (Integer) session.getAttribute("userid")));
	  return "redirect:/cart";
	 }
	 
	 @RequestMapping("editorder/{id}")
		public String editorder(@PathVariable("id") int id, @RequestParam("quantity") int q, HttpSession session) {
			Cart cart = cartDAO.getitem(id);
			Product product = productDAO.get(cart.getProductid());
			System.out.println("cartlist==="+cart.getProductid());
			System.out.println("productlist="+product);
			cart.setQuantity(q);
			cart.setPrice(q * product.getPrice());
			cartDAO.saveorupdate(cart);
			session.setAttribute("cartsize", cartDAO.Cartsize((Integer) session.getAttribute("userid")));
			return "redirect:/cart";
		}

	 @RequestMapping(value="/cart")
	 public ModelAndView cartpage(@ModelAttribute("cart") Cart cart,HttpSession session){
	  ModelAndView mv= new ModelAndView("home");
	  int userid = (Integer) session.getAttribute("userid");
	  mv.addObject("CartList", cartDAO.get(userid));
	  if(cartDAO.Cartsize((Integer) session.getAttribute("userid"))!=0){
		   mv.addObject("cartprice", cartDAO.CartPrice((Integer) session.getAttribute("userid")));
	  }else
	  {
	 
	  mv.addObject("emptycart","Sorry your cart is empty");
	  }
	  mv.addObject("UserClickedCart","true");
	  return mv;
	 }
	 
	 @RequestMapping("placeorder")
	 public String placeorder(Model model)
	 {
	  model.addAttribute("IfPaymentClicked", "true");
	  model.addAttribute("HideOthers","true");
	  return "payment";
	 }

	 @RequestMapping("pay")
	 public String payment(HttpSession session) {
	  cartDAO.pay((Integer) session.getAttribute("userid"));
	  return "home";
	 }
	 /*@RequestMapping(value="navproducts/{id}")
	    public String navproduct(Model m,@PathVariable("id") int id ){
	    	m.addAttribute("Clickedcatproduct", "true");
	    	m.addAttribute("navproducts", productDAO.navproduct(id));
	    	return "Cart";
	    }*/
	
	}