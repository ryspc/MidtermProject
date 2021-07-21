package com.skilldistillery.housereport.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.housereport.data.AddressDAO;
import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.ListingPhotoDAO;
import com.skilldistillery.housereport.data.RatingDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.ListingPhoto;
import com.skilldistillery.housereport.entities.PropertyType;
import com.skilldistillery.housereport.entities.Rating;
import com.skilldistillery.housereport.entities.RatingId;
import com.skilldistillery.housereport.entities.User;

@Controller
public class ListingController {
	@Autowired
	private UserDAO userDao;

	@Autowired
	private ListingDAO listingDao;
	
	@Autowired
	private AddressDAO addressDao;

	@Autowired
	private RatingDAO ratingDao;
	
	@Autowired
	private ListingPhotoDAO photoDao;

	@RequestMapping(path = { "showListings.do" })
	public String showListings(Model model) {
		return "listing";
	}

	@RequestMapping(path = "editListing.do", method = RequestMethod.POST)
	public String editListing(Model model, Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		model.addAttribute("listing", dbListing);
		return "editListing";
	}

	@RequestMapping(path = "updateListing.do", method = RequestMethod.POST)
	public String updateListing(Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		dbListing.setPrice(listing.getPrice());
		dbListing.setSquareFeet(listing.getSquareFeet());
		dbListing.setBathNumber(listing.getBathNumber());
		dbListing.setBedNumber(listing.getBedNumber());
		dbListing.setPropertyCrimeRate(listing.getPropertyCrimeRate());
		dbListing.setViolentCrimeRate(listing.getViolentCrimeRate());
		dbListing.setHoaMonthlyRate(listing.getHoaMonthlyRate());
		dbListing.setYearBuilt(listing.getYearBuilt());
		dbListing.setLotSizeSqft(listing.getLotSizeSqft());
		dbListing.setPropertyTax(listing.getPropertyTax());
		dbListing.setParkingType(listing.getParkingType());
		listingDao.update(dbListing, dbListing.getAddress());
		return "redirect:profile.do";
	}

	@RequestMapping(path = { "showRating.do" })
	public ModelAndView showRating(Listing listing) {
		ModelAndView mv = new ModelAndView();
		int listingID = listing.getId();
		listingDao.updateRating(listingID);
		mv.addObject("listing", listing);
		mv.setViewName("listing");
		return mv;
	}

	@RequestMapping(path = "listingUpdateListing.do", method = RequestMethod.POST)
	public String listingUpdateListing(Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		dbListing.setPrice(listing.getPrice());
		dbListing.setSquareFeet(listing.getSquareFeet());
		dbListing.setBathNumber(listing.getBathNumber());
		dbListing.setBedNumber(listing.getBedNumber());
		dbListing.setPropertyCrimeRate(listing.getPropertyCrimeRate());
		dbListing.setViolentCrimeRate(listing.getViolentCrimeRate());
		dbListing.setHoaMonthlyRate(listing.getHoaMonthlyRate());
		dbListing.setYearBuilt(listing.getYearBuilt());
		dbListing.setLotSizeSqft(listing.getLotSizeSqft());
		dbListing.setPropertyTax(listing.getPropertyTax());
		dbListing.setParkingType(listing.getParkingType());
		listingDao.update(dbListing, dbListing.getAddress());
		return "redirect:listing.do";
	}
	
	@RequestMapping(path = "listingEditListing.do", method = RequestMethod.POST)
	public String listingEditListing(Model model, Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		model.addAttribute("listing", dbListing);
		return "listingEditListing";
	}
	
	@RequestMapping(path = "expandListing.do", method = RequestMethod.POST)
	public ModelAndView expandListing(int id) {
		ModelAndView mv = new ModelAndView();
		listingDao.updateRating(id);
		Listing listing = listingDao.findById(id);
		mv.addObject("selectedListing", listing);
		mv.setViewName("listing");
		return mv;
	}
	

	@RequestMapping(path="createListing.do", method=RequestMethod.GET)
	public String createListing(Model model) {
		return "createListing";
	}
	
	@RequestMapping(path="createdListing.do", method=RequestMethod.POST)
	public String createdListing(Model model, HttpSession session, Address address, Listing listing, PropertyType propertyType, ListingPhoto photo) {
		User dbUser = (User)session.getAttribute("user");
		System.out.println(dbUser);
		listing.setUser(dbUser);
		ListingPhoto lp = photoDao.create(listing, dbUser, address, propertyType, photo);
		dbUser = userDao.findById(dbUser.getId());
		dbUser.getListings().size();
		session.setAttribute("user", dbUser);
//		dbUser.getListings().get(listing.getId()).getListingPhotos().add(photo);
//		session.setAttribute("user", dbUser);
//		photo.setListing(listing);
//		Listing dbListing = listingDao.create(listing, dbUser, address, propertyType, photo);
//		System.out.println(dbUser.getId() + "TEST FROM CREATED LISTING!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		photo.setListing(dbListing);
//		dbListing.getListingPhotos().add(photo);
//		ListingPhoto dbPhoto = photoDao.create(photo);
		return "redirect:profile.do";
	}

	@RequestMapping(path = "addRating.do", params= {"listingID", "userID", "vote"}, method= RequestMethod.POST)
	public String addRating(Model model, int listingID, int userID, String vote) {
		User dbUser = userDao.findById(userID);
		Listing dbListing = listingDao.findById(listingID);
		int ratingNum = Integer.parseInt(vote);
		boolean rating = false;
		if (ratingNum == 1) rating = true;
		RatingId ratingID = new RatingId(listingID, userID);
		Rating ratingObj = new Rating(ratingID, rating, dbUser, dbListing);
		Rating persistedRating = ratingDao.createRating(ratingObj);
		model.addAttribute("selectedListing", dbListing);
		model.addAttribute("rating", persistedRating);
		return "listing";
		
	}
	
	@RequestMapping(path="deleteListing.do", method=RequestMethod.POST)
	public String deleteListing(Listing listing) {
		listingDao.delete(listing);
		return "redirect:profile.do";
	}
	
	@RequestMapping(path="modifyListing.do", params= {"action"}, method=RequestMethod.POST)
	public String modifyListing(RedirectAttributes redir, Listing listing, String action) {
		if(action.equals("Delete")) {
			redir.addFlashAttribute("listing", listing);
			return "deleteListing";
		} else if(action.equals("Edit")) {
			redir.addFlashAttribute("listing", listing);
			return "redirect:editListing.do";
		} else {
			return "userProfile";
		}
	}

	

}