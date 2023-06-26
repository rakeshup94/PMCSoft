using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using INGM.Core.ViewModel.Booking;
namespace INGM.Web.Helpers
{
    public class PriceHelper
    {
        public travyooMarkup Markup { get; set; }
        public travyooMarkup AgentMarkup { get; set; }
        public travyooMarkup StaffMarkup { get; set; }
        public decimal BuyingRate { get; set; }
        public decimal SellingRate { get; set; }
        public PriceHelper(travyooMarkup markup, travyooMarkup agentMarkup, travyooMarkup staffMarkup, decimal buyingRate, decimal sellingRate)
        {
            this.Markup = markup;
            this.AgentMarkup = agentMarkup;
            this.StaffMarkup = staffMarkup;
            this.BuyingRate = buyingRate;
            this.SellingRate = sellingRate;
        }
        public PriceHelper(travyooMarkup agentMarkup, travyooMarkup staffMarkup, decimal buyingRate, decimal sellingRate)
        {
            this.AgentMarkup = agentMarkup;
            this.StaffMarkup = staffMarkup;
            this.BuyingRate = buyingRate;
            this.SellingRate = sellingRate;
        }
        public CostModel Costing(decimal price)
        {
            decimal MrkValue = 0;
            CostModel objPrice = new CostModel();
            objPrice.SuplCost = price;
            objPrice.ClientCost = objPrice.SuplCost * BuyingRate;
            if (Markup.Type == 1)
            {
                MrkValue = objPrice.ClientCost * Markup.Amount / 100;
            }
            else
            {
                MrkValue = Markup.Amount;
            }
            objPrice.ClientMarkup = MrkValue;
            objPrice.ClienSale = objPrice.ClientCost + MrkValue;
            objPrice.tAgentCost = objPrice.ClienSale * this.SellingRate;
            if (AgentMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * AgentMarkup.Amount / 100;
            }
            else
            {
                MrkValue = AgentMarkup.Amount;
            }
            objPrice.tAgentSale = objPrice.tAgentCost + MrkValue;
            if (StaffMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * StaffMarkup.Amount / 100;
            }
            else
            {
                MrkValue = StaffMarkup.Amount;
            }
            objPrice.CustCost = objPrice.tAgentSale + MrkValue;
            return objPrice;
        }
        public CostModel Costing(decimal price, int count)
        {
            decimal MrkValue = 0;
            CostModel objPrice = new CostModel();
            objPrice.SuplCost = price;
            objPrice.ClientCost = objPrice.SuplCost * BuyingRate;
            if (Markup.Type == 1)
            {
                MrkValue = objPrice.ClientCost * Markup.Amount / 100;
            }
            else
            {
                MrkValue = Markup.Amount * count;
            }
            objPrice.ClienSale = objPrice.ClientCost + MrkValue;
            objPrice.tAgentCost = objPrice.ClienSale * this.SellingRate;
            if (AgentMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * AgentMarkup.Amount / 100;
            }
            else
            {
                MrkValue = AgentMarkup.Amount * count;
            }
            objPrice.tAgentSale = objPrice.tAgentCost + MrkValue;
            if (StaffMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * StaffMarkup.Amount / 100;
            }
            else
            {
                MrkValue = StaffMarkup.Amount * count;
            }
            objPrice.CustCost = objPrice.tAgentSale + MrkValue;
            return objPrice;
        }
        public CostModel Costing(decimal price, travyooMarkup markup)
        {
            decimal MrkValue = 0;
            CostModel objPrice = new CostModel();
            objPrice.SuplCost = price;
            objPrice.ClientCost = objPrice.SuplCost * BuyingRate;
            if (markup.Type == 1)
            {
                MrkValue = objPrice.ClientCost * markup.Amount / 100;
            }
            else
            {
                MrkValue = markup.Amount;
            }
            objPrice.ClienSale = objPrice.ClientCost + MrkValue;
            objPrice.tAgentCost = objPrice.ClienSale * this.SellingRate;
            if (AgentMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * AgentMarkup.Amount / 100;
            }
            else
            {
                MrkValue = AgentMarkup.Amount;
            }
            objPrice.tAgentSale = objPrice.tAgentCost + MrkValue;
            if (StaffMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * StaffMarkup.Amount / 100;
            }
            else
            {
                MrkValue = StaffMarkup.Amount;
            }
            objPrice.CustCost = objPrice.tAgentSale + MrkValue;
            return objPrice;
        }
        public CostModel TotalCosting(decimal price, int night, int room, int offerType, travyooMarkup addedOffer)
        {
            decimal MrkValue = 0;
            CostModel objPrice = new CostModel();
            objPrice.SuplCost = price;
            objPrice.ClientCost = objPrice.SuplCost * BuyingRate;
            if (Markup.Type == 1)
            {
                MrkValue = objPrice.ClientCost * Markup.Amount / 100;
            }
            else
            {
                MrkValue = Markup.Amount * night * room;
            }

            objPrice.ClientMarkup = MrkValue;
            if (addedOffer.Type == 1)
            {
                objPrice.ClientOffer = (objPrice.ClientCost * addedOffer.Amount / 100);
            }
            else
            {
                objPrice.ClientOffer = addedOffer.Amount;

            }
            if (offerType == 1)
            {
                MrkValue += objPrice.ClientOffer;
            }
            else if (offerType == 2)
            {
                MrkValue -= objPrice.ClientOffer;
            }            

            objPrice.ClienSale = objPrice.ClientCost + MrkValue;
            objPrice.tAgentCost = objPrice.ClienSale * this.SellingRate;
            if (AgentMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * AgentMarkup.Amount / 100;
            }
            else
            {
                MrkValue = AgentMarkup.Amount * night * room;
            }
            objPrice.tAgentSale = objPrice.tAgentCost + MrkValue;
            if (StaffMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * StaffMarkup.Amount / 100;
            }
            else
            {
                MrkValue = StaffMarkup.Amount * night * room;
            }
            objPrice.CustCost = objPrice.tAgentSale + MrkValue;
            return objPrice;
        }
        
        public CostModel Costing(decimal price, int offerType, travyooMarkup addedOffer)
        {
            decimal MrkValue = 0;
            CostModel objPrice = new CostModel();
            objPrice.SuplCost = price;
            objPrice.ClientCost = objPrice.SuplCost * BuyingRate;
            if (Markup.Type == 1)
            {
                MrkValue = objPrice.ClientCost * Markup.Amount / 100;
            }
            else
            {
                MrkValue = Markup.Amount;
            }


            objPrice.ClientMarkup = MrkValue;
            if (addedOffer.Type == 1)
            {
                objPrice.ClientOffer = (objPrice.ClientCost * addedOffer.Amount / 100);
            }
            else
            {
                objPrice.ClientOffer = addedOffer.Amount;

            }

            if (offerType == 1)
            {
                MrkValue += objPrice.ClientOffer;
            }
            else if (offerType == 2)
            {
                MrkValue -= objPrice.ClientOffer;
            }
            objPrice.ClienSale = objPrice.ClientCost + MrkValue;
            objPrice.tAgentCost = objPrice.ClienSale * this.SellingRate;
            if (AgentMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * AgentMarkup.Amount / 100;
            }
            else
            {
                MrkValue = AgentMarkup.Amount;
            }
            objPrice.tAgentSale = objPrice.tAgentCost + MrkValue;
            if (StaffMarkup.Type == 1)
            {
                MrkValue = objPrice.tAgentCost * StaffMarkup.Amount / 100;
            }
            else
            {
                MrkValue = StaffMarkup.Amount;
            }
            objPrice.CustCost = objPrice.tAgentSale + MrkValue;
            return objPrice;
        }

        public List<List<CancelPrice>> OfferCxlPolicy(List<CancelPrice> MACnclCharges, List<CancelPrice> SACxCharges, SupplierInfo supplierInfo, int nights, int offerType, travyooMarkup addedOffer, decimal DesiredSellingRate)
        {
            int cnt = 0;
            List<List<CancelPrice>> AdditionalCxlPolicy = new List<List<CancelPrice>>(); 
            List<CancelPrice> StaffCxlCharges = new List<CancelPrice>();
            List<CancelPrice> CustomerCxlCharges = new List<CancelPrice>();
            
            foreach (var maCxlCharge in MACnclCharges)
            {
                decimal mCxlMarkup = 0.0m, addnlMarkup = 0.0m, sacharges = 0.0m, SaChargeDsrCncy = 0.0m, SaStaffcharges = 0.0m, customercharges = 0.0m;
                if (maCxlCharge.Price > 0)
                {
                    //Agent charges
                    if ((int)supplierInfo.CXLMarkupType == 1)
                    {
                        mCxlMarkup = maCxlCharge.Price * supplierInfo.CXLMarkup / 100;
                    }
                    else
                    {
                        mCxlMarkup = supplierInfo.CXLMarkup * nights;
                    }
                  
                    addnlMarkup = (addedOffer.Type == 1) ? (maCxlCharge.Price * addedOffer.Amount / 100) : addedOffer.Amount;
                   
                    if (offerType == 1)
                    {
                        mCxlMarkup += addnlMarkup;
                    }
                    else if (offerType == 2)
                    {
                        mCxlMarkup -= addnlMarkup;
                    }
                    sacharges = (maCxlCharge.Price + mCxlMarkup) * this.SellingRate;
                  
                    SaChargeDsrCncy = (DesiredSellingRate > 0)? ((maCxlCharge.Price + mCxlMarkup) * DesiredSellingRate):sacharges;
                    //Agent charges

                    //Agent Staff charges
                    if ((int)supplierInfo.AgentMarkup == 1)
                    {
                        SaStaffcharges = sacharges + (sacharges * supplierInfo.AgentMarkup / 100);
                    }
                    else
                    {
                        SaStaffcharges = sacharges + (supplierInfo.AgentMarkup * nights);
                    }
                    //-Agent Staff charges

                    //End Customer charges
                    if ((int)supplierInfo.AgentMarkupType == 1)
                    {
                        customercharges = SaChargeDsrCncy + (SaChargeDsrCncy * supplierInfo.AgentMarkup / 100);
                    }
                    else
                    {
                        customercharges = SaChargeDsrCncy + (supplierInfo.AgentMarkup * nights);
                    }
                    if ((int)supplierInfo.AgentStaffMarkupType == 1)
                    {
                        customercharges = customercharges + (SaChargeDsrCncy * supplierInfo.AgentStaffMarkup / 100);
                    }
                    else
                    {
                        customercharges = customercharges + (supplierInfo.AgentStaffMarkup * nights);
                    }
                    // End Customer charges
                    
                }
                SACxCharges[cnt].Price = sacharges;
                StaffCxlCharges.Add(new CancelPrice
                {
                    Night = SACxCharges[cnt].Night,
                    Price = SaStaffcharges,
                    Status = SACxCharges[cnt].Status
                });
                CustomerCxlCharges.Add(new CancelPrice
                {
                    Night = SACxCharges[cnt].Night,
                    Price = customercharges,
                    Status = SACxCharges[cnt].Status
                });
                cnt++;
            }
            AdditionalCxlPolicy.Add(SACxCharges);
            AdditionalCxlPolicy.Add(StaffCxlCharges);
            AdditionalCxlPolicy.Add(CustomerCxlCharges);

            return AdditionalCxlPolicy;
        }
     }
}