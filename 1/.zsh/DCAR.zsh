#!/bin/bash


read -d '' String <<"EOF"
    Miall, Hugh, Oliver Ramsbotham and Tom Woodhouse.  (2011).   Contemporary Conflict Resolution. 3[rd] Edition.  Cambridge, UK:  Polity Press.

    Lederach, John Paul. (2005). The Moral Imagination:  the Art and Soul of Building Peace. Oxford, UK:  Oxford UP.

    Cheldelin, Druckman and Fast, eds.  (2008). Conflict, 2[nd] ed. London: Continuum Press.

    Pruitt, Dean and Kim, Sung Hee. (2003). Social Conflict: Escalation, Stalemate and Settlement (3[rd] edition). New York, NY: McGraw Hill.
    Cloke, Kenneth. (2008).   Conflict Revolution:  Mediating Evil, War, Injustice, and Terrorism. Santa Ana, CA:  Janis Publications.
    McDonald, John and Louise Diamond.  (1996).  Multi-Track Diplomacy:  a Systems Approach to Peace.  West Hartford, CT:  Kumarian Press.

    Tidwell, Alan C.  (2001).  Conflict Resolved?  London, UK:  Pinter Publishers.
EOF

wcar_textbooks() {echo $String | egrep -i --color=auto "$1"}



read -d '' wString <<"wEOF"

    Ackerman Peter and Jack Duvall. (2000).  A Force More Powerful: a Century of Nonviolent Conflict. New York:  Palgrave.

    Anderson, Benedict. (2003).   Imagined Communities. Revised Ed. London:  Verso.

    Anderson, M.B. and L. Olson.  (2003).  Confronting War:  Critical Lessons for Peace Practitioners. Cambridge, MA:  Collaborative for Development Action.

    Appadurai, Arjun.  (1996). Modernity at Large: Cultural Dimensions of Globalization. Minneapolis, MN:  Univ. of Minn.

    Arendt, Hannah.  (1965).  On Revolution.  London:  Penguin Press.

    Avruch, Kevin and Peter Black. (1991). "The culture question and conflict resolution."  Peace and Change 16, 1:  22-45.

    Azar, Edward.  (1990).  The Management of Protracted Social Conflict:  Theory and Cases.  Dartmouth:  Aldershot.

    Babb, Sarah.  (2005). "The Social Consequences of Structural Adjustment." Annual Review of Sociology.  31. 199-222.

    Barber, Benjamin. (1992). "Jihad Vs. McWorld" The Atlantic Monthly. (Online at
    http://www.theatlantic.com/doc/199203/barber).

    Bhagwait, Jagdish.  (2007). In Defense of Globalization. New York:  Oxford UP.
    Black, Peter and Kevin Avruch. (1999).  "Cultural Relativism, Conflict Resolution and Social Justice."  Peace and Conflict Studies.  6, 1 and 2. Online at
    http://www.gmu.edu/academic/pcs/BlackAvruch61PCS.html

    Boulding, Elise. (2000).    Cultures of Peace:  The Hidden Side of History. Syracuse, NY:  Syracuse University Press.

    Burton, John, ed. (1990).     Conflict: Human Needs Theory.  New York:  St. Martin's Press.
    Chang, Ha-Joon.  (2002). Kicking Away the Ladder: Development Strategy in Historical Perspective.  London:  Anthem Press.

    Cloke, Kenneth. (2008).  Conflict Revolution:  Mediating Evil, War, Injustice and Terrorism.  Santa Ana, CA:   Janis Publications.

    Collier, Paul. (2008).  The Bottom Billion.  Oxford, UK:  Oxford University Press.

    Coser, Lewis A. (1956). The Functions of Social Conflict.  New York:  Free Press.

    Croucher, Sheila. (2004).   Globalization and Belonging. Oxford, UK:   Rowman and Littlefield Publishers, Inc.

    Dollar, David and Aart Kraay.  (2002). "Spreading the Wealth." Foreign Affairs. 81, 1.

    Duckworth, Cheryl.  (2011).  Land and Dignity in Paraguay.  New York, NY:  Continuum.

    Duckworth, Cheryl and Consuelo Kelley, eds.  (2012).  Conflict Resolution and the Scholarship of Engagement:  Partnerships Transforming Conflict.  Cambridge, UK:  Cambridge Scholars Publishing.

    Fellman, Gordon. (1998).  Rambo and the Dalai Lama:  the Compulsion to Win and the Threat to Human Survival.  Albany, NY:  State University of NY.

    Foucault, Michel. (1995). Discipline and Punish: The Birth of the Prison. 2[nd] Ed. New York:  Vintage Books.

    Frankl, Victor.  (2006).  Man's Search for Meaning.  Boston:  Beacon Press.

    Galbraith, James K. "A Perfect Crime: Inequality in the Age of Globalization." Daedalus.
    131:  1. 11-26.

    Galtung, Johan.  (1996).  Peace by Peaceful Means.  London:  Sage Publications.
    Gilligan, James. (1996).  Violence. New York:  Vintage Books.
    Girard, Rene.  (1972).  Violence and the Sacred.  Trans. Patrick Gregory.  Baltimore, MD:  Johns Hopkins Univ. Press.
    Gunder Frank, Andre. "The Development of Underdevelopment." In Wilber, Charles K.
    Wilber's The Political Economy of Development and Underdevelopment. Random House: New
    York, NY, 1988.

    Gurr, Ted R. (1971). Why Men Rebel.  Princeton, PA: Princeton University Press.

    Hedges, Chris. (2002). War Is a Force That Gives Us Meaning. New York:  Public Affairs.

    Holland, Jack.  (2006).  Misogyny:  the World's Oldest Prejudice. Carroll and Graf Publishers:  New York.

    Huntington, Samuel.  (1993). "The Clash of Civilizations." Foreign Affairs. (Available
    online at http://www.foreignaffairs.org/19930601faessay5188/samuel-p-huntington/the-clash-ofcivilizations.html)

    Jabri, Vivienne. (1996).   "A Structurationist Theory of Conflict." Discourses on Violence. Manchester, NY:  Manchester UP.

    Kaldor, Mary.  (2006).  New and Old Wars:  Organized Violence in a Global Era.  2[nd] Edition.  Cambridge, UK:  Polity Press.

    Korostelina, Karina.  (2012).  Forming a Culture of Peace.  New York, NY:  Palgrave Macmillan.

    Kreisberg, Louis.  (2006).  Constructive Conflicts:  from Escalation to Resolution.  3[rd] edition.  Lanham, MD:  Roman and Littlefield.

    Lederach, J.P. (1997).  Building Peace:  Sustainable Reconciliation in Divided Societies.  Washington, DC:  USIP Press.

    Matyok, Thomas, Jessica Senehi and Sean Byrne, eds. (2011).  Critical Issues in Peace and Conflict Studies.  Plymouth, UK:  Lexington Books.

    Ndura- ouédraogo, Elavie and Randall Amster, eds.  (2009).  Building Cultures of Peace:
    Transdisciplinary Voices of Hope and Action.  Cambridge, UK:  Cambridge Scholars Publishing.

    Paffenholz, Thania, ed.  (2010). Civil Society and Peacebuilding.  Boulder, CO:  Lynne Rienner Publishers.

    Ricks, Thomas.  (2009).  The Gamble:  Gen. David Petraeus and the American Military Adventure in Iraq, 2006-08.  New York:  Penguin Press.

    Rifkin, Jeremy.  (2009).  The Empathic Civilization:  the Race to Global Consciousness in
    a World in Crisis.  NY, NY:  Penguin Group.

    Rubenstein, Rich. (1996). "Basic Human Needs: Steps Toward Further
    Theory Development." (Available at http://www.richrubenstein.com/articles.htm or
    http://www.gmu.edu/academic/ijps/vol6_1/Rubenstein.htm)

    Rubenstein, Rich.  (2010).  Reasons to Kill:  Why Americans Chose War.  New York:  Bloomsbury Press.

    Sadowdski, Yahya. (1998). The Myth of Global Chaos. Washington, DC:  Brookings Institute Press.

    Sandole, Dennis J.D., Sean Byrne et al, eds.  (2009).  Handbook of Conflict Analysis and Resolution.  New York, NY:  Routledge.

    Schirch, Lisa. (2005). The Little Book of Strategic Peacebuilding.  Intercourse, PA: Good Books.

    Sen, Amartya. (2000). Development as Freedom. New York:  Anchor Books.

    Sen, Amartya.  (2006).  Identity and Violence: the Illusion of Destiny. New York:  WW Norton.

    Sharp, Gene. (2005). Waging Non-violent Struggle. Westford, MA:  Porter Sargent Publishers.

    Simon, Roger. (1991). Gramsci's Political Thought. London, UK:  Lawrence and Wishart.
    Stigletz, Joseph. (2002).  Globalization and Its Discontents. New York, NY:  W. W. Norton.

    Tuchman, Barbara.  (1962).  The Guns of August.  New York:  Ballantine Books.

    Volkan, Vamik.  (1998).  Bloodlines:  from Ethnic Pride to Ethnic Terrorism.  Boulder, CO:  Westview Press.

    Webel, Charles P. and Jørgen Johansen.  (2012). Peace and Conflict Studies:  A Reader.  New York, NY:  Routledge.

    Wolff, Stefan and Christalla Yakinthou, eds.  (2012).  Conflict Resolution in Divided Societies.  New York, NY:  Routledge.

    Zelizer, Craig and Robert A. Rubinstein. (2009).   Building Peace:  Practical Reflections from the Field.  Sterling, VA:  Kumarian Press.

============================

----------------------

wEOF


wwcar_books_read() {echo $wString | egrep -i --color=auto "$1"}

