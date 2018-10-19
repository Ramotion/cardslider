
import UIKit
import CardSlider

struct Movie: CardSliderItem {
	let image: UIImage
	let rating: Int?
	let title: String
	let subtitle: String?
	let description: String?
}

class ViewController: UIViewController {
	let movies = [
			Movie(image: #imageLiteral(resourceName: "9"), rating: 5, title: "Blade Runner 2049", subtitle: "2017", description: "A young blade runner's discovery of a long-buried secret leads him to track down former blade runner Rick Deckard, who's been missing for thirty years."),
			Movie(image: #imageLiteral(resourceName: "1"), rating: 3, title: "Back to the Future", subtitle: nil, description: nil),
			Movie(image: #imageLiteral(resourceName: "8"), rating: 2, title: "Ghostbusters", subtitle: "2016", description: "Physicists Abby Yates and Erin Gilbert are authors of a research book which posits the existence of paranormal phenomena, such as ghosts. While Abby continued to study the paranormal at a technical college with eccentric engineer Jillian Holtzmann, Erin, now a professor at Columbia University, disowned the work, fearing it will impact her tenure. When Abby republishes the book, Erin convinces her to agree to remove the book from publication in exchange by helping Abby and Jillian in a paranormal investigation. They witness a malevolent ghost, restoring Erin's belief in the paranormal, but video footage of the investigation is posted online, and Erin is fired by the university. She joins Abby and Jillian to set up new offices above a Chinese restaurant, calling themselves \"Conductors of the Metaphysical Examination\". They build equipment to study and capture ghosts, and hire the dimwitted but handsome Kevin Beckman as a receptionist."),
			Movie(image: #imageLiteral(resourceName: "2"), rating: 4, title: "Goodfellas", subtitle: "1990", description: "In 1955, Henry Hill, a high school student, becomes enamored of the criminal life in his neighborhood, and begins working for Paul \"Paulie\" Cicero and his associates: James \"Jimmy the Gent\" Conway, a truck hijacker; and Tommy DeVito, a fellow juvenile delinquent. Henry begins as fence for Jimmy, gradually working his way up to more serious crimes. Enjoying the perks of their criminal life, the three associates spend most of their nights at the Copacabana nightclub, carousing with women. Henry meets and later marries Karen Friedman, a Jewish woman from the Five Towns area of Long Island. Karen is initially troubled by Henry's criminal activities, but is soon seduced by his glamorous lifestyle.\n\nIn 1970, Billy Batts, a mobster in the Gambino crime family, repeatedly insults Tommy at a nightclub owned by Henry. Enraged, Tommy and Jimmy attack and kill him. Knowing their murder of a made man would mean retribution from the Gambinos, which could possibly include Paulie being ordered to kill them, Jimmy, Henry, and Tommy cover up the murder. They transport the body in the trunk of Henry's car, and bury it in upstate New York. Six months later, Jimmy learns that the burial site is slated for development, forcing them to exhume the decomposing corpse and move it.\n\nHenry decides to live with Janice, but Paulie insists he returns to Karen after completing a job for him. Henry and Jimmy are sent to collect a debt from a gambler in Tampa, but they are arrested after being turned in by the gambler's sister, a typist for the FBI. Jimmy and Henry receive ten-year prison sentences. In prison, Henry sells drugs smuggled in by Karen to support his family on the outside. In 1978, Henry is paroled, and expands his cocaine trade against Paulie's orders, soon involving Jimmy and Tommy. Jimmy organizes a crew to raid the Lufthansa vault at John F. Kennedy International Airport and take $6 million. After some of the crew buy expensive items in spite of Jimmy's orders and the getaway truck is found by police, he has most of the crew murdered. Tommy and Henry are spared from Jimmy's wrath, but Tommy is eventually killed by the Gambinos in retribution for Batts' murder, having been fooled into thinking he would become a made man.\n\nIn 1980, Henry has become a nervous wreck from cocaine use and insomnia. He tries to organize a drug deal with his associates in Pittsburgh, but he is arrested by narcotics agents, and jailed. After he is bailed out, Karen explains that she flushed $60,000 worth of cocaine down the toilet to prevent FBI agents from finding it during their raid, leaving the family virtually penniless. Feeling betrayed by Henry's drug dealing, Paulie gives him $3,200, and ends their association. Facing federal charges and realizing that Jimmy is planning to have him killed, Henry decides to enroll in the Witness Protection Program. He gives sufficient testimony to have Paulie and Jimmy arrested and convicted. Forced out of his gangster life, Henry now has to face living in the real world. He narrates \"I'm an average nobody. I get to live the rest of my life like a schnook\".\n\nThe end title cards reveal that Henry is still in the Witness Protection Program and in 1987, he was arrested in Seattle for narcotics conspiracy and he received five years probation. Since then, Henry has been clean. After 25 years of marriage, Henry and Karen separated in 1989. Paul Cicero died in 1988 in Fort Worth Federal Prison at the age of 73 due to respiratory illness. Jimmy Conway is serving a 20 years to life sentence in a New York prison for murder and that he would not be eligible for parole until 2004 when he would be 78 years old."),
			Movie(image: #imageLiteral(resourceName: "5"), rating: 5, title: "Pulp Fiction", subtitle: "1994", description: "Vincent Vega (John Travolta) and Jules Winnfield (Samuel L. Jackson) are hitmen with a penchant for philosophical discussions. In this ultra-hip, multi-strand crime movie, their storyline is interwoven with those of their boss, gangster Marsellus Wallace (Ving Rhames) ; his actress wife, Mia (Uma Thurman) ; struggling boxer Butch Coolidge (Bruce Willis) ; master fixer Winston Wolfe (Harvey Keitel) and a nervous pair of armed robbers, \"Pumpkin\" (Tim Roth) and \"Honey Bunny\" (Amanda Plummer)."),
			Movie(image: #imageLiteral(resourceName: "7"), rating: nil, title: "Fear and Loathing in Las Vegas", subtitle: "1998", description: "Raoul Duke (Johnny Depp) and his attorney Dr. Gonzo (Benicio Del Toro) drive a red convertible across the Mojave desert to Las Vegas with a suitcase full of drugs to cover a motorcycle race. As their consumption of drugs increases at an alarming rate, the stoned duo trash their hotel room and fear legal repercussions. Duke begins to drive back to L.A., but after an odd run-in with a cop (Gary Busey), he returns to Sin City and continues his wild drug binge."),
			Movie(image: #imageLiteral(resourceName: "6"), rating: 5, title: "The Big Lebowski", subtitle: "1998", description: "Jeff 'The Dude' Leboswki is mistaken for Jeffrey Lebowski, who is The Big Lebowski. Which explains why he's roughed up and has his precious rug peed on. In search of recompense, The Dude tracks down his namesake, who offers him a job. His wife has been kidnapped and he needs a reliable bagman. Aided and hindered by his pals Walter Sobchak, a Vietnam vet, and Donny, master of stupidity."),
	]
	
	@IBAction func openMoviesPressed(_ sender: Any) {
		let cardSlider = CardSliderViewController.with(dataSource: self)
		cardSlider.title = "Movies"
		present(cardSlider, animated: true, completion: nil)
	}
}

extension ViewController: CardSliderDataSource {
	func item(for index: Int) -> CardSliderItem {
		return movies[index]
	}
	
	func numberOfItems() -> Int {
		return movies.count
	}
}
