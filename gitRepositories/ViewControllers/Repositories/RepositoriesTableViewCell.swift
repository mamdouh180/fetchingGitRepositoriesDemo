

import UIKit

class RepositoriesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var archived: UILabel!
    @IBOutlet weak var language: UIButton!
    @IBOutlet weak var watchers: UIButton!
    @IBOutlet weak var forks: UIButton!
    @IBOutlet weak var license: UIButton!
    @IBOutlet weak var updatingDate: UILabel!
    @IBOutlet weak var loadingMoreActivityIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- set cell values
    func setName(cell: RepositoriesTableViewCell, text: String){
        cell.name.text = text
    }
    
    func setDescription(cell: RepositoriesTableViewCell, text: String){
        cell.repoDescription.text = text
    }
    
    func setLanguage(cell: RepositoriesTableViewCell, text: String){
        cell.language.setTitle(text, for: .normal)
    }
    
    func setWatchers(cell: RepositoriesTableViewCell, text: String){
        cell.watchers.setTitle(text, for: .normal)
    }
    
    func setForks(cell: RepositoriesTableViewCell, text: String){
        cell.forks.setTitle(text, for: .normal)
    }
    
    func setLicense(cell: RepositoriesTableViewCell, text: String){
        cell.license.setTitle(text, for: .normal)
    }
    
    func setUpdatingDate(cell: RepositoriesTableViewCell, text: String){
        //cell.updatingDate.text = text
        
        if let updateDate = Utls.getDate(dateString: text){
            let currentDate = Date()
            
            if let yearsDifeerence = Calendar.current.dateComponents([.year], from: updateDate, to: currentDate).year{
                if yearsDifeerence > 0{
                    let yearText = yearsDifeerence == 1 ? NSLocalizedString("update_year", comment: "") : NSLocalizedString("update_years", comment: "")
                    cell.updatingDate.text = "\(NSLocalizedString("update_first_word", comment: "")) \(yearsDifeerence) \(yearText) \(NSLocalizedString("update_last_word", comment: ""))"
                    return
                }
            }
            
            if let monthsDifeerence = Calendar.current.dateComponents([.month], from: updateDate, to: currentDate).month{
                if monthsDifeerence > 0{
                    let monthText = monthsDifeerence == 1 ? NSLocalizedString("update_month", comment: "") : NSLocalizedString("update_months", comment: "")
                    cell.updatingDate.text = "\(NSLocalizedString("update_first_word", comment: "")) \(monthsDifeerence) \(monthText) \(NSLocalizedString("update_last_word", comment: ""))"
                    return
                }
            }
            
            if let daysDifeerence = Calendar.current.dateComponents([.day], from: updateDate, to: currentDate).day{
                if daysDifeerence > 0{
                    let daysText = daysDifeerence == 1 ? NSLocalizedString("update_day", comment: "") : NSLocalizedString("update_days", comment: "")
                    cell.updatingDate.text = "\(NSLocalizedString("update_first_word", comment: "")) \(daysDifeerence) \(daysText) \(NSLocalizedString("update_last_word", comment: ""))"
                    return
                }
            }
            
            if let hoursDifeerence = Calendar.current.dateComponents([.hour], from: updateDate, to: currentDate).hour{
                if hoursDifeerence > 0{
                    let hoursText = hoursDifeerence == 1 ? NSLocalizedString("update_hour", comment: "") : NSLocalizedString("update_hours", comment: "")
                    cell.updatingDate.text = "\(NSLocalizedString("update_first_word", comment: "")) \(hoursDifeerence) \(hoursText) \(NSLocalizedString("update_last_word", comment: ""))"
                    return
                }
            }
        }
        
    }
    
    func changeArchivingVisibility(cell: RepositoriesTableViewCell, makeInvisible: Bool){
        cell.archived.isHidden = makeInvisible
    }
    
    func changeLicenseVisibility(cell: RepositoriesTableViewCell, makeInvisible: Bool){
        cell.license.isHidden = makeInvisible
    }
    
    //MARK:- Changing visibility
    func changeLoadingMoreActivityIndicatorVisibility(cell: RepositoriesTableViewCell, makeInvisible: Bool){
        cell.loadingMoreActivityIndicator.isHidden = makeInvisible
    }

}
