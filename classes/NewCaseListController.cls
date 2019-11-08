public class NewCaseListController {

	public List<Case> getNewCases(){
		List<Case> cases = [Select Id, CaseNumber From Case Where Status = 'New'];
		return cases;		

	}

}