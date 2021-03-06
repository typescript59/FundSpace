//
//  DeveloperProjectOverVC.swift
//  FundSpace
//
//  Created by admin on 8/27/19.
//  Copyright © 2019 Zhang Hui. All rights reserved.
//

import UIKit
import GoogleMaps
import SVProgressHUD
import SCLAlertView

class DeveloperProjectOverViewVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var projectTypeLabel: UILabel!
    @IBOutlet weak var projectTypeView: UIView!
    @IBOutlet weak var projectAddDateTextField: UITextField!
    @IBOutlet weak var projectCompleteTextField: UITextField!
    
    @IBOutlet weak var projectBasicInfoContainerView: UIView!
    @IBOutlet weak var projectBasicInfoView: UIView!
    @IBOutlet weak var projectCapitalCostLabel: UILabel!
    @IBOutlet weak var projectPermissionLabel: UILabel!
    @IBOutlet weak var projectTitleLabel: UILabel!
    @IBOutlet weak var projectAddressLabel: UILabel!
    @IBOutlet weak var unitsView: UIView!
    @IBOutlet weak var unitsLabel: UILabel!
    
    @IBOutlet weak var projectInfoView: UIView!
    @IBOutlet weak var projectCurrentView: UIView!
    @IBOutlet weak var projectCurrentLabel: UILabel!
    @IBOutlet weak var projectPurchaseView: UIView!
    @IBOutlet weak var projectPurchaseLabel: UILabel!
    @IBOutlet weak var projectGDVView: UIView!
    @IBOutlet weak var projectGDVLabel: UILabel!
    
    @IBOutlet weak var projectCostsView: UIView!
    @IBOutlet weak var projectCostsTitleView: UIView!
    @IBOutlet weak var projectTotalCostsView: UIView!
    @IBOutlet weak var projectTotalCostsLabel: UILabel!
    @IBOutlet weak var projectStampDutyTextField: UITextField!
    @IBOutlet weak var projectBuildCostTextField: UITextField!
    @IBOutlet weak var projectVATTextField: UITextField!
    @IBOutlet weak var projectLegalsTextField: UITextField!
    @IBOutlet weak var projectValuationTextField: UITextField!
    @IBOutlet weak var projectCILTextField: UITextField!
    @IBOutlet weak var projectFeesTextField: UITextField!
    @IBOutlet weak var projectWarrantiesTextField: UITextField!
    @IBOutlet weak var projectSurveyorTextField: UITextField!
    @IBOutlet weak var projectSalesTextField: UITextField!
    @IBOutlet weak var projectContingencyTextField: UITextField!
    
    @IBOutlet weak var costProfitChartView: MKMagneticProgress!
    @IBOutlet weak var developerProfitView: UIView!
    @IBOutlet weak var developerProfitLabel: UILabel!
    
    @IBOutlet weak var projectExtraInfoView: UIView!
    @IBOutlet weak var projectSecurityTextField: UITextField!
    @IBOutlet weak var projectStrategyTextField: UITextField!
    @IBOutlet weak var projectTermRequiredTextField: UITextField!
    @IBOutlet weak var projectUnitsTextField: UITextField!
    @IBOutlet weak var projectBedroomsTextField: UITextField!
    @IBOutlet weak var projectBathroomsTextField: UITextField!
    @IBOutlet weak var projectTotalSqftTextField: UITextField!
    @IBOutlet weak var projectCostPerSqftTextField: UITextField!
    @IBOutlet weak var projectGDVPerSqftTextField: UITextField!
    @IBOutlet weak var projectPlanningTextField: UITextField!
    @IBOutlet weak var projectTenureTextField: UITextField!
    @IBOutlet weak var projectBuildDurationTextField: UITextField!
    
    @IBOutlet weak var projectBuildingContractorView: UIView!
    @IBOutlet weak var firstContractorTextField: UITextField!
    @IBOutlet weak var secondContractorTextField: UITextField!
    @IBOutlet weak var thirdContractorTextField: UITextField!
    
    @IBOutlet weak var projectArchitectView: UIView!
    @IBOutlet weak var firstArchitectTextField: UITextField!
    @IBOutlet weak var secondArchitectTextField: UITextField!
    @IBOutlet weak var thirdArchitectTextField: UITextField!
    
    @IBOutlet weak var projectSolicitorView: UIView!
    @IBOutlet weak var firstSolicitorTextField: UITextField!
    @IBOutlet weak var secondSolicitorTextField: UITextField!
    @IBOutlet weak var thirdSolicitorTextField: UITextField!
    
    @IBOutlet weak var projectEngineerView: UIView!
    @IBOutlet weak var firstEngineerTextField: UITextField!
    @IBOutlet weak var secondEngineerTextField: UITextField!
    @IBOutlet weak var thirdEngineerTextField: UITextField!
    
    @IBOutlet weak var projectComparablePropertiesView: UIView!
    
    @IBOutlet weak var uploadDocumentBtn: UIButton!
    @IBOutlet weak var deleteProjectBtn: UIButton!
    
    var rightButtonItem: UIBarButtonItem!
    var projectID: String = ""
    var projectInfo: [String: Any] = [:]
    var isSave: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SVProgressHUD.setDefaultMaskType(.clear)
        initUI()
        loadProjectInfo()
    }
    
    func initUI() {
        let borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        projectTypeView.clipsToBounds = true
        projectTypeView.layer.cornerRadius = 10
        projectTypeView.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        projectBasicInfoContainerView.addBottomBorder(color: borderColor, margins: 0, borderLineSize: 0.5)
        projectBasicInfoView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        
        projectInfoView.addBottomBorder(color: borderColor, margins: 0, borderLineSize: 0.5)
        projectCurrentView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        projectPurchaseView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        projectGDVView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        
        projectCostsView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        projectCostsTitleView.addBottomBorder(color: borderColor, margins: 0, borderLineSize: 0.5)
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = projectTotalCostsView.frame
        rectShape.position = projectTotalCostsView.center
        rectShape.path = UIBezierPath(roundedRect: projectTotalCostsView.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        projectTotalCostsView.layer.mask = rectShape
        
        costProfitChartView.orientation = .top
        developerProfitView.layer.borderColor = UIColor(red: 0, green: 0.49, blue: 1, alpha: 1).cgColor
        developerProfitView.layer.borderWidth = 6
        developerProfitView.layer.cornerRadius = developerProfitView.bounds.width / 2
        
        projectExtraInfoView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        
        projectBuildingContractorView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        projectArchitectView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        projectSolicitorView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        projectEngineerView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        
        projectComparablePropertiesView.makeRoundShadowView(cornerRadius: 5, shadowRadius: 14)
        
        uploadDocumentBtn.layer.cornerRadius = 4
        deleteProjectBtn.layer.borderColor = UIColor(red: 0, green: 0.49, blue: 1, alpha: 1).cgColor
        deleteProjectBtn.layer.cornerRadius = 4
        deleteProjectBtn.layer.borderWidth = 1
        
        let position = CLLocationCoordinate2D(latitude: 51.476693, longitude: -0.200340)
        let london = GMSMarker(position: position)
        london.title = "London"
        london.icon = UIImage(named: "pin")
        london.map = mapView
        
        rightButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(self.rightButtonItemClick))
        self.navigationItem.rightBarButtonItem = rightButtonItem
        
        projectStampDutyTextField.delegate = self
        projectBuildCostTextField.delegate = self
        projectVATTextField.delegate = self
        projectLegalsTextField.delegate = self
        projectValuationTextField.delegate = self
        projectCILTextField.delegate = self
        projectFeesTextField.delegate = self
        projectSurveyorTextField.delegate = self
        projectSalesTextField.delegate = self
        projectContingencyTextField.delegate = self
    }
    
    func loadProjectInfo() {
        SVProgressHUD.show()
        FirebaseService.sharedInstance.getProjectByID(id: projectID) { (data, error) in
            SVProgressHUD.dismiss()
            if let error = error {
                let errorMsg = error.localizedDescription
                Utils.sharedInstance.showError(title: "Error", message: errorMsg)
                return
            }
            
            self.projectInfo = data
            self.applyDataToUI()
        }
    }
    
    func applyDataToUI() {
        projectAddDateTextField.text = projectInfo["added"] as? String ?? ""
        projectCompleteTextField.text = projectInfo["complete"] as? String ?? ""
        
        projectTypeLabel.text = projectInfo["type"] as? String ?? ""
        projectCapitalCostLabel.text = projectInfo["contribute"] as? String ?? ""
        projectPermissionLabel.text = projectInfo["hasFullPermission"] as? Bool ?? true ? "Total funding required" : ""
        projectTitleLabel.text = projectInfo["title"] as? String ?? ""
        projectAddressLabel.text = projectInfo["street"] as? String ?? ""
        
        let units: Int = Int(projectInfo["units"] as? String ?? "") ?? 0
        
        if units == 0 {
            unitsView.isHidden = true
        } else {
            unitsView.isHidden = false
            unitsLabel.text = "x"+String(units)
        }
        
        projectCurrentLabel.text = projectInfo["current"] as? String ?? ""
        projectPurchaseLabel.text = projectInfo["purchase"] as? String ?? ""
        projectGDVLabel.text = projectInfo["gdv"] as? String ?? ""
        
        projectStampDutyTextField.text = projectInfo["stampDuty"] as? String ?? ""
        projectBuildCostTextField.text = projectInfo["build"] as? String ?? ""
        projectVATTextField.text = projectInfo["vat"] as? String ?? ""
        projectLegalsTextField.text = projectInfo["legals"] as? String ?? ""
        projectValuationTextField.text = projectInfo["valuation"] as? String ?? ""
        projectCILTextField.text = projectInfo["cil"] as? String ?? ""
        projectFeesTextField.text = projectInfo["fees"] as? String ?? ""
        projectWarrantiesTextField.text = projectInfo["warranties"] as? String ?? ""
        projectSurveyorTextField.text = projectInfo["surveyor"] as? String ?? ""
        projectSalesTextField.text = projectInfo["sales"] as? String ?? ""
        projectContingencyTextField.text = projectInfo["contingency"] as? String ?? ""
        
        projectUnitsTextField.text = projectInfo["units"] as? String ?? ""
        projectBedroomsTextField.text = projectInfo["bedrooms"] as? String ?? ""
        projectBathroomsTextField.text = projectInfo["bathrooms"] as? String ?? ""
        
        projectTotalSqftTextField.text = projectInfo["totalSqft"] as? String ?? ""
        projectGDVPerSqftTextField.text = projectInfo["gdvPerSqft"] as? String ?? ""
        projectCostPerSqftTextField.text = projectInfo["costPerSqft"] as? String ?? ""
        
        projectSecurityTextField.text = projectInfo["securityType"] as? Int ?? 1 == 1 ? "1st charge" : "2nd charge"
        projectPlanningTextField.text = projectInfo["planning"] as? String ?? ""
        projectStrategyTextField.text = projectInfo["strategy"] as? String ?? ""
        projectTenureTextField.text = projectInfo["tenure"] as? String ?? ""
        projectTermRequiredTextField.text = projectInfo["terms"] as? String ?? ""
        projectBuildDurationTextField.text = projectInfo["duration"] as? String ?? ""
        
        let contractor: [String: Any] = projectInfo["contractor"] as? [String: Any] ?? [:]
        firstContractorTextField.text = contractor["first"] as? String ?? ""
        secondContractorTextField.text = contractor["second"] as? String ?? ""
        thirdContractorTextField.text = contractor["third"] as? String ?? ""
        
        let architect: [String: Any] = projectInfo["architect"] as? [String: Any] ?? [:]
        firstArchitectTextField.text = architect["first"] as? String ?? ""
        secondArchitectTextField.text = architect["second"] as? String ?? ""
        thirdArchitectTextField.text = architect["third"] as? String ?? ""
        
        let solicitor: [String: Any] = projectInfo["solicitor"] as? [String: Any] ?? [:]
        firstSolicitorTextField.text = solicitor["first"] as? String ?? ""
        secondSolicitorTextField.text = solicitor["second"] as? String ?? ""
        thirdSolicitorTextField.text = solicitor["third"] as? String ?? ""
        
        let engineers: [String: Any] = projectInfo["engineer"] as? [String: Any] ?? [:]
        firstEngineerTextField.text = engineers["first"] as? String ?? ""
        secondEngineerTextField.text = engineers["second"] as? String ?? ""
        thirdEngineerTextField.text = engineers["third"] as? String ?? ""
        
        updateProfit()
   }
    
    func makeEditable(_ flag: Bool) {
        projectAddDateTextField.isEnabled = flag
        projectCompleteTextField.isEnabled = flag
        projectStampDutyTextField.isEnabled = flag
        projectBuildCostTextField.isEnabled = flag
        projectVATTextField.isEnabled = flag
        projectLegalsTextField.isEnabled = flag
        projectValuationTextField.isEnabled = flag
        projectCILTextField.isEnabled = flag
        projectFeesTextField.isEnabled = flag
        projectWarrantiesTextField.isEnabled = flag
        projectSurveyorTextField.isEnabled = flag
        projectSalesTextField.isEnabled = flag
        projectContingencyTextField.isEnabled = flag
        projectUnitsTextField.isEnabled = flag
        projectBedroomsTextField.isEnabled = flag
        projectBathroomsTextField.isEnabled = flag
        projectSecurityTextField.isEnabled = flag
        projectStrategyTextField.isEnabled = flag
        projectTermRequiredTextField.isEnabled = flag
        projectTotalSqftTextField.isEnabled = flag
        projectGDVPerSqftTextField.isEnabled = flag
        projectCostPerSqftTextField.isEnabled = flag
        projectPlanningTextField.isEnabled = flag
        projectTenureTextField.isEnabled = flag
        projectBuildDurationTextField.isEnabled = flag
        firstContractorTextField.isEnabled = flag
        secondContractorTextField.isEnabled = flag
        thirdContractorTextField.isEnabled = flag
        firstArchitectTextField.isEnabled = flag
        secondArchitectTextField.isEnabled = flag
        thirdArchitectTextField.isEnabled = flag
        firstSolicitorTextField.isEnabled = flag
        secondSolicitorTextField.isEnabled = flag
        thirdSolicitorTextField.isEnabled = flag
        firstEngineerTextField.isEnabled = flag
        secondEngineerTextField.isEnabled = flag
        thirdEngineerTextField.isEnabled = flag
    }
    
    func saveProjectInfo() {
        let complete: String = projectCompleteTextField.text ?? ""
        let stampDuty: String = projectStampDutyTextField.text ?? ""
        let build: String = projectBuildCostTextField.text ?? ""
        let vat: String = projectVATTextField.text ?? ""
        let legals: String = projectLegalsTextField.text ?? ""
        let valuation: String = projectValuationTextField.text ?? ""
        let cil: String = projectCILTextField.text ?? ""
        let fees: String = projectFeesTextField.text ?? ""
        let warranties: String = projectWarrantiesTextField.text ?? ""
        let surveyor: String = projectSurveyorTextField.text ?? ""
        let sales: String = projectSalesTextField.text ?? ""
        let contingency: String = projectContingencyTextField.text ?? ""
        let units: String = projectUnitsTextField.text ?? ""
        let bedrooms: String = projectBedroomsTextField.text ?? ""
        let bathrooms: String = projectBathroomsTextField.text ?? ""
        let totalSqft: String = projectTotalSqftTextField.text ?? ""
        let gdvPerSqft: String = projectGDVPerSqftTextField.text ?? ""
        let costPerSqft: String = projectCostPerSqftTextField.text ?? ""
        let securityType: String = projectSecurityTextField.text ?? ""
        let planning: String = projectPlanningTextField.text ?? ""
        let strategy: String = projectStrategyTextField.text ?? ""
        let tenure: String = projectTenureTextField.text ?? ""
        let terms: String = projectTermRequiredTextField.text ?? ""
        let duration: String = projectBuildDurationTextField.text ?? ""
        let firstContractor: String = firstContractorTextField.text ?? ""
        let secondContractor: String = secondContractorTextField.text ?? ""
        let thirdContractor: String = thirdContractorTextField.text ?? ""
        let firstArchitect: String = firstArchitectTextField.text ?? ""
        let secondArchitect: String = secondArchitectTextField.text ?? ""
        let thirdArchitect: String = thirdArchitectTextField.text ?? ""
        let firstSolicitor: String = firstSolicitorTextField.text ?? ""
        let secondSolicitor: String = secondSolicitorTextField.text ?? ""
        let thirdSolicitor: String = thirdSolicitorTextField.text ?? ""
        let firstEngineer: String = firstEngineerTextField.text ?? ""
        let secondEngineer: String = secondEngineerTextField.text ?? ""
        let thirdEngineer: String = thirdEngineerTextField.text ?? ""
        
        projectInfo["complete"] = complete
        projectInfo["stampDuty"] = stampDuty
        projectInfo["build"] = build
        projectInfo["vat"] = vat
        projectInfo["legals"] = legals
        projectInfo["valuation"] = valuation
        projectInfo["cil"] = cil
        projectInfo["fees"] = fees
        projectInfo["warranties"] = warranties
        projectInfo["surveyor"] = surveyor
        projectInfo["sales"] = sales
        projectInfo["contingency"] = contingency
        projectInfo["units"] = units
        projectInfo["bedrooms"] = bedrooms
        projectInfo["bathrooms"] = bathrooms
        projectInfo["totalSqft"] = totalSqft
        projectInfo["gdvPerSqft"] = gdvPerSqft
        projectInfo["costPerSqft"] = costPerSqft
        projectInfo["securityType"] = securityType
        projectInfo["planning"] = planning
        projectInfo["strategy"] = strategy
        projectInfo["tenure"] = tenure
        projectInfo["terms"] = terms
        projectInfo["duration"] = duration
        projectInfo["contractor"] = [
            "first": firstContractor,
            "second": secondContractor,
            "third": thirdContractor
        ]
        projectInfo["architect"] = [
            "first": firstArchitect,
            "second": secondArchitect,
            "third": thirdArchitect
        ]
        projectInfo["solicitor"] = [
            "first": firstSolicitor,
            "second": secondSolicitor,
            "third": thirdSolicitor
        ]
        projectInfo["engineer"] = [
            "first": firstEngineer,
            "second": secondEngineer,
            "third": thirdEngineer
        ]
        
        FirebaseService.sharedInstance.updateProject(id: projectID, projectInfo: projectInfo) { (error) in
            if let error = error {
                let errorMessage = error.localizedDescription
                Utils.sharedInstance.showError(title: "Error", message: errorMessage)
                return
            }
            
            let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
            let successAlert = SCLAlertView(appearance: appearance)
            successAlert.addButton("OK", action: {
                self.rightButtonItem.title = "Edit"
                self.makeEditable(false)
            })
            successAlert.showSuccess("Success", subTitle: "Your project has been successfully updated!")
        }
    }
    
    func updateProfit() {
        let stamp: Int = Int(projectStampDutyTextField.text ?? "") ?? 0
        let build: Int = Int(projectBuildCostTextField.text ?? "") ?? 0
        let vat: Int = Int(projectVATTextField.text ?? "") ?? 0
        let legals: Int = Int(projectLegalsTextField.text ?? "") ?? 0
        let valuation: Int = Int(projectValuationTextField.text ?? "") ?? 0
        let cil: Int = Int(projectCILTextField.text ?? "") ?? 0
        let fees: Int = Int(projectFeesTextField.text ?? "") ?? 0
        let surveyor: Int = Int(projectSurveyorTextField.text ?? "") ?? 0
        let sales: Int = Int(projectSalesTextField.text ?? "") ?? 0
        let contingency: Int = Int(projectContingencyTextField.text ?? "") ?? 0
        
        let totalCost: Int = stamp + build + vat + legals + valuation + cil + fees + surveyor + sales + contingency
        
        projectTotalCostsLabel.text = String(totalCost)
        
        let GDV: Int = Int(projectGDVLabel.text ?? "") ?? 0
        
        let developerProfit: Int = GDV - totalCost
        developerProfitLabel.text = String(developerProfit)
        
        let profitCost: CGFloat = CGFloat(developerProfit) / CGFloat(totalCost)
        costProfitChartView.setProgress(progress: profitCost)
    }
    
    @objc func rightButtonItemClick() {
        if !isSave {
            rightButtonItem.title = "Save"
            makeEditable(true)
        } else {
            saveProjectInfo()
        }
        
        isSave = !isSave
    }
    
    // MARK: TextField delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == projectStampDutyTextField ||
           textField == projectBuildCostTextField ||
           textField == projectVATTextField ||
           textField == projectLegalsTextField ||
           textField == projectValuationTextField ||
           textField == projectCILTextField ||
           textField == projectFeesTextField ||
           textField == projectSurveyorTextField ||
           textField == projectSalesTextField ||
            textField == projectContingencyTextField {
            updateProfit()
        }
        
        if textField == projectBedroomsTextField {
            if let unit = textField.text, unit.count > 0 {
                unitsView.isHidden = false
                unitsLabel.text = "x"+textField.text!
            } else {
                unitsView.isHidden = true
            }
        }
    }
    
    
    @IBAction func uploadDocumentBtn_Click(_ sender: Any) {
    }
    
    
    @IBAction func deleteProjectBtn_Click(_ sender: Any) {
        SVProgressHUD.show()
        FirebaseService.sharedInstance.deleteProject(id: projectID) { (error) in
            if let error = error {
                let errorMessage = error.localizedDescription
                Utils.sharedInstance.showError(title: "Error", message: errorMessage)
            } else {
                let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
                let successAlert = SCLAlertView(appearance: appearance)
                successAlert.addButton("OK", action: {
                    self.navigationController?.popViewController(animated: true)
                })
                successAlert.showSuccess("Success", subTitle: "Your project has been successfully deleted!")
            }
        }
    }
}
