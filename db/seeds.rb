# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['registered', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

['answer', 'video_ans'].each do |content|
  Price.find_or_create_by({content: content})
end

# ['150.00', '500.00'].each do |price|
#   Price.find_or_create_by({price: price})
# end

['<h4><center>DARASA TERMS AND CONDITIONS</center></h4>
    <h5>IT IS IMPORTANT THAT YOU READ THESE TERMS OF USE (&quot;TERMS&quot;) CAREFULLY AS THEY,
      TOGETHER WITH ANY POLICIES OR GUIDELINES ON THE DARASA WEBSITE AND APPLICATION
      GOVERN YOUR USE OF AWESOME NAIROBI (O/A DARASA) (&quot;DARASA&quot;)&#39;S SERVICES PROVIDED
      THROUGHT THE <a href="http://www.darasa.co.ke" target="_blank">WWW.DARASA.CO.KE </a> WEBSITE (THE &quot;WEBSITE&quot;).
      USE OF THIS WEBSITE IS NOT PERMITTED WHERE PROHIBITED BY LAW. AS A CONDITION OF USING
      THIS WEBSITE, YOU REPRESENT AND WARRANT THAT (A) ALL REGISTRATION INFORMATION YOU SUBMIT
      TO DARASA IS TRUE AND ACCURATE; (B) YOU WILL MAINTAIN THE ACCURACY OF SUCH INFORMATION; (C)
      YOU ARE AT LEAST THIRTEEN (13) YEARS OF AGE.
      BY USING THIS WEBSITE YOU INDICATE YOUR ACCEPTANCE OF THESE TERMS. IF YOU DO NOT ACCEPT THESE
      TERMS, THEN DO NOT USE THIS WEBSITE OR ANY OF ITS CONTENT OR SERVICES.
    </h5>
    <p>Please contact Us: <a href="mailto:edwin@awesomenairobi.com" target="_blank">edwin@awesomenairobi.com</a> for any queries.</p>
    <h5>NOW, THEREFORE, THIS AGREEMENT WITNESSETH that, in consideration of the mutual covenants contained
      herein, the Parties hereto agree as follows:</h5>
    <h4>1. DEFINITIONS</h4>
    <p>&quot;Agreement&quot; means this Agreement between Us and You;
      &quot;Content&quot; means the material provided to Awesome Nairobi Ltd for Use on the Darasa platforms, it includes:
      self-created lecture notes, materials and works;
      &quot;We&quot;, &quot;Our&quot; and &quot;Us&quot; means Awesome Nairobi Ltd;
      &quot;You&quot; or &quot;Your&quot; means the person or company who will be: providing/donating content to Awesome Nairobi Ltd -
      the provider of the Darasa platform, utilising the content provided on the Darasa platform and a potential
      complainant as contemplated in this agreement, as the case may be.
      Other terms are ascribed their ordinary meaning at English, or at law, as the case may be.</p>
    <h4>2. ABOUT DARASA</h4>
  <p>Darasa is an online educational community where registered users You may contribute Content for access, use, and
    evaluation by other users of the Website.
    These Terms may be amended or updated by Darasa from time to time without notice so these Terms may have changed
    since your last visit to this Website and it is your responsibility to review these Terms for any changes. Your use
    of the Website after any amendments or updates of these Terms shall signify your assent to and acceptance of such revised
    terms. Any new features that may be added to this Website from time to time will be subject to these Terms, unless stated
    otherwise. You should visit this page periodically to review these Terms.</p>
  <h4>3. ACCOUNTS </h4>
  <p>CLOSING YOUR ACCOUNT - You may close Your account at any time by sending a request to <a href="mailto:edwin@awesomenairobi.com" target="_blank">edwin@awesomenairobi.com</a>. Your
    account will be closed within 48 to 72 hours after receiving Your request. The closure of Your account will mean the
    termination of access to Darasa and its free and paid services, including ability to upload Content, view Content, or
    profit from the distribution of any Content provided and previously uploaded by You. Previously posted and uploaded
    Content will remain on Darasa indefinitely unless Darasa, in its sole discretion, decides to remove it. </p>
  <h4>4. PAYMENT TERMS</h4>
  <p>4.1. We charge on a per unit basis, such that each unit is charged differently at a price decided solely by Us.</p>
  <p>4.2. By paying, You get unlimited access to that unit&#39;s content. </p>
  <p>4.3. We reserve the right to revise Our prices and billing structures at any time in the future. Any price changes will be sent
    to You 30 days before the change is effected via email. </p>
  <p>4.4. We Use PesaPal API to facilitate payments through Our platform. You are able to select from a range of payment options
    through the PesaPal service. We should be indemnified from any issues regarding payment owed to PesaPal&#39;s negligence. </p>
  <p>4.5. We do not provide refunds for any payments made to access content or any amount due as a result of a revision of Our
    prices and billing structures.</p>
  <h4>5. CONTENT WARRANTIES</h4>
  <p>If you provide Content, you represent and warrant that you are the sole owner of all/any Content posted to Darasa or have the
    owner&#39;s authority to provide such Content to the Website, other Users and Darasa and you possess all necessary rights in said
    Content to make it available on the Website and for use by other Users and Darasa, including, without limitation, copyright. You
    also represent and warrant that the posting of Content on or through Darasa and its services will not breach intellectual property
    rights, privacy rights, contract rights, copyrights or any other rights of any third-party. You acknowledge and agree to pay for
    any and all royalties, fees, and any other monies or monetary obligations owing to any third-party for any Content provided and
    uploaded by you to Darasa. You also represent and warrant that you will not use the Website in breach of any applicable law or
    regulation, including university or other academic regulations.</p>
  <h4>6. CONTENT AND USE</h4>
  <p>If you upload or wish to submit Content to the Website, you thereby grant Darasa a perpetual, irrevocable, nonexclusive, royalty-free,
    worldwide right and license (with unrestricted right to grant sublicenses) to post, distribute, display, copy, reproduce, modify, alter,
    translate, publish, distribute, download, transmit and otherwise use such Content in any format or medium for any purpose whatsoever,
    including, but not limited to, commercially profiting therefrom. Content uploaded will be visible to other Users and may be accessed,
    displayed, downloaded, printed and otherwise used for personal, academic or educational purposes. Darasa assumes no liability for any
    material provided by Users, which may contain inaccurate, incomplete, inappropriate and offensive material. Darasa does not review or
    evaluate the accuracy of Content provided by Users.
    Content stored on the Website are stored by Darasa only for permitted temporary online sharing purposes and not for permanent or long-term
    storage or for temporary archival purposes. Darasa will not, and is not obligated to, maintain back-up copies of any and all Content or any User&#39;s
    Darasa account information. Accordingly, Darasa will bear no responsibility or liability for any loss of Content or other information stored or
    submitted to the Website.
  </p>
  <h4>7. PROHIBITED CONTENT AND ACTIVITIES</h4>
  <p>Darasa reserves the right to restrict, suspend or terminate access to all or any part of Darasa&#39; services at any time, for any reason, with or
    without prior notice and without any liability to you. Use of the Website is subject to all applicable local, provincial and federal laws and
    regulations. Users are solely responsible for all activities, acts and omissions that occur in, from, through or under their user names or
    passwords. Users shall not (a) copy or distribute any part of the Website (including all of the contents of the Website), (b) alter or modify
    any part of the Website, (c) upload, post, email, transmit or otherwise make available on the Website any material that is unlawful, harmful,
    threatening, abusive, harassing, tortuous, defamatory, vulgar, obscene, pornographic, libelous, invasive of another&#39;s privacy, hateful, or racially
    or ethnically objectionable, encourages criminal behavior, gives rise to civil liability, violates any law, or is otherwise objectionable, or post a
    link to the Website from any third-party website(s) containing such content; (d) upload, post, email, transmit or otherwise make available any
    falsehoods or misrepresentations or create an impression that the User knows is incorrect, misleading, or deceptive, or any material that could
    damage or harm minors in any way; (e) impersonate any person or entity or misrepresent their affiliation with a person or entity; (f) forge headers
    or otherwise manipulate identifiers in order to disguise the origin of any material transmitted to or through the website or impersonate another
    person or organization; (g) upload, post, email, transmit or otherwise make available any material that they do not have a right to make available under any law or under a contractual relationship; (h) upload, post, email,
    transmit or otherwise make available any material that infringes any patent, trademark, trade secret, copyright or other proprietary rights of any
    party (including privacy and publicity rights), or post a link to the Website from any third-party website(s) containing such content; (i) upload,
    post, email, transmit or otherwise make available any unsolicited or unauthorized advertising, solicitations for business, promotional materials,
    &quot;junk mail,&quot; &quot;spam,&quot; &quot;chain letters,&quot; &quot;pyramid schemes,&quot; or any other form of solicitation; (j) upload, post, email, transmit or otherwise make
    available any material that contains software viruses or any other computer code, files or programs designed to interrupt, destroy or limit the
    functionality of any computer software or hardware or telecommunications equipment or data or the website or that of any users or viewers of the
    website or that compromises a user&#39;s privacy; (k) interfere with or disrupt the Website or servers or networks connected to the Website, or disobey
    any requirements, procedures, policies or regulations of networks connected to the website or probe, scan, or test the vulnerability of any system
    or network or breach or circumvent any security or authentication measures; (l) intentionally or unintentionally violate any applicable local, state,
    national or international law or regulation; (m) collect or store personal data about other users or viewers; or (n) resell the content of the Website,
    the use of the Website or access to the Website.</p>
  <p>Users also agree not to access the website in a manner that utilizes the resources of the Website more heavily than would be the case for an individual
    person using a conventional web browser.</p>
  <h4>8. DARASA&#39;S PROPRIETARY RIGHTS</h4>
  <p>Except for (a) Content or (b) intellectual property belonging to Users, all information, materials and content on the Website, including but not limited
    to design, text, graphics, academic data, course materials, documents, messages, ratings, reviews, other files, and their selection and arrangement
    (collectively, &quot;Darasa Content&quot;) are the property of Darasa and/or its licensors, with all rights reserved. Users acknowledge and agree that the Darasa
    Content is protected by intellectual property rights which may include copyright, trademarks, service marks,
    patents or other proprietary rights and laws, including laws covering data access and data compilations. No Darasa Content may be modified, copied, distributed,
    framed, reproduced, republished, downloaded, displayed, incorporated into any derivative works or compilations, posted, transmitted, rented or sold in any form
    or by any means, in whole or in part, without Darasa&#39; prior written permission. Users may not republish Darasa Content on any Internet, Intranet or Extranet
    site or incorporate the information in any other database or compilation.
  </p>
  <h4>9. COMMUNICATIONS WITH THIS SITE</h4>
  <p>Darasa welcomes feedback and suggestions from Users regarding the website or Darasa services. Any feedback, comments, or suggestions Users may provide
    regarding Darasa, or the Website and services is entirely voluntary and Darasa will be free to use such feedback, comments or suggestions as we see fit,
    including but not limited to creating and marketing products, information, or services, and without any obligation to the User.
    The transmission of any communication or material to Darasa via the Website or electronic mail, whether encrypted or otherwise, cannot be guaranteed as,
    and is not represented to be, secure.</p>
  <h4>10. COPYRIGHT POLICY</h4>
  <p>Users agree that they will not abuse their usage of Darasa and its services to reproduce, post, distribute, sell or modify any copyrighted material,
    trademarks or intellectual property belonging to third parties without obtaining prior written consent of the owner for such rights. Darasa reserves
    the right in its sole discretion to remove any and all Content posted by any user for any reason as Darasa sees fit. Darasa reserves the right and
    ability to terminate membership privileges of any User who infringes upon the copyright, trademarks and intellectual property of third parties upon
    notification to Darasa by the owner of the rights.</p>
  <h4>11. COPYRIGHT VIOLATION CLAIMS</h4>
  <p>If a User wishes to make a claim of copyright infringement, you must provide notification to Darasa by sending us the following information via email
    to using the following format:</p>
    <ol>
      <li>1. Include a statement telling us that you have found content on <a href="http://Darasa.co.ke" target="_blank">Darasa.co.ke</a> which you believe infringes your copyright (for example, &quot;I believe
        that the notes identified below infringe my copyright&quot;).</li>
      <li>2. Tell us which country your copyright applies to.</li>
      <li>3. Tell us the title of the content concerned and the full URL for its page.</li>
      <li>4 .Explain to us in what way that content infringes your copyright (e.g. the text is copied, the entire content is a copy of an original work made by you, etc.)</li>
      <li>5 .Identify the type (and details of (e.g. title, publisher, dates, etc.) the copyright work which you own the rights in, and which you believe has been infringed.
        If this information is available on the internet, it is helpful to send us a link.</li>
      <li>6. Let us have contact information so that we can get in touch with you (email address is preferred).</li>
      <li>7. Let us have the contact information which we can pass on to the submitter of the content concerned, so that they can get in touch with you to resolve your complaint
        directly (email address is preferred).</li>
      <li>8. Include the following statement: &quot;I have a good faith belief that use of the copyrighted work described above is not authorized by the copyright owner
        (or by a third party who is legally entitled to do so on behalf of the copyright owner) and is not otherwise permitted by law. I swear that the information
        contained in this notification is accurate and that I am the copyright owner or have an exclusive right in law to bring infringement proceedings with respect to its use.&quot;</li>
      <li>9. Sign the notice. If you are providing notice by e-mail, a scanned physical signature or a valid electronic signature will be accepted.</li>
      <li>10 .Send the notice, in English, to the following address: Attn: Darasa Copyright Infringement Notification <a href="mailto:emaganjo@gmail.com" target="_blank">emaganjo@gmail.com</a>: <b>
        Please also note that the information provided in this legal notice may be forwarded to the person who provided the allegedly infringing content. Please also make sure you know
        whether the content that you have seen on the Website infringes your copyright because there may be adverse legal consequences in your country if you make a false or bad faith
        allegation of copyright infringement by using this process.
      </b></li>
    </ol>
  <h4>12. DISCLAIMERS</h4>
  <p>Darasa is not responsible for any inaccuracies in Content posted or uploaded by Users or of any links. As well, Darasa does not guarantee the accuracy of any Content provided and
    uploaded by Darasa. Darasa is not responsible for any errors or omissions or for any consequences that may arise from the use of such &quot;flawed&quot; information. Darasa, Darasa Content,
    any Content made available through the site are made available &quot;as is&quot; and &quot;with all faults.&quot; The usage of Darasa, its services and Content is entirely at the individual risk of
    Users and Darasa assumes no responsibility for third party advertisements which may be posted on Darasa nor does it assume responsibility for any goods or services advertised with its partners.</p>
  <p>The online and offline conduct of any User is not the responsibility of Darasa. Darasa assumes no responsibility for errors, omissions, interruptions, deletions, defects, delay in operation or transmission,
    communications line failure, theft or destruction or unauthorized access to, or alteration of, any communication. Darasa cannot be held responsible for any problems or technical malfunction including but not
    limited to computer systems, servers or internet providers, computer equipment, software, or failure of email/email accounts that may be due to technical problems or Internet congestion problems. Darasa will
    not be responsible or liable for any harm to your computer system, loss of data, or other harm that results from your access to or use of the Website or any Content. Under no circumstances shall Darasa be responsible
    for loss or damage arising from: (i) use of Darasa and its services, (ii) any Content uploaded on or through Darasa and its services (including, without limitation, from any use of or reliance on any such Content) or
    from the conduct of any Users of the Darasa Services, whether online or offline. Services provided by Darasa are provided &quot;as is&quot; and Darasa expressly disclaims the Website and its services from any warranty or guarantee
    of fitness for any purpose or non-infringement. Darasa cannot and does not guarantee and promise that the Website and its services will always be available and functional, neither can it guarantee or promise any specific
    deterioration or improvement in academic results that may arise from use of the Website and its services.</p>
  <h4>13. LIMITATION OF LIABILITY AND REMEDIES</h4>
  <p><u>6.1 LIMITATION OF LIABILITY </u>IN NO EVENT WILL WE BE LIABLE FOR ANY LOSSES OR DAMAGES INCURRED BY YOU, WHETHER DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY OR CONSEQUENTIAL, INCLUDING LOST OR ANTICIPATED
    PROFITS, SAVINGS, INTERRUPTION TO BUSINESS, LOSS OF BUSINESS OPPORTUNITIES, LOSS OF BUSINESS INFORMATION, THE COST OF RECOVERING SUCH LOST INFORMATION, THE COST OF SUBSTITUTE INTELLECTUAL PROPERTY OR ANY OTHER
    PECUNIARY LOSS ARISING FROM THE INABILITY TO USE, THE CONTENT REGARDLESS OF WHETHER YOU HAVE ADVISED US OR WE HAVE ADVISED YOU OF THE POSSIBILITY OF SUCH DAMAGES. THE FOREGOING LIMITATIONS APPLY REGARDLESS OF THE
    CAUSE OR CIRCUMSTANCES GIVING RISE TO SUCH LOSS, DAMAGE OR LIABILITY, EVEN IF SUCH LOSS, DAMAGE OR LIABILITY IS BASED ON NEGLIGENCE OR OTHER TORTS OR BREACH OF CONTRACT (INCLUDING FUNDAMENTAL BREACH OR BREACH OF A FUNDAMENTAL TERM).
    NEITHER YOU NOR WE MAY INSTITUTE ANY ACTION IN ANY FORM ARISING OUT OF THIS AGREEMENT MORE THAN ONE (1) YEAR AFTER THE CAUSE OF ACTION HAS ARISEN. </p>
  <p>13.1.1. Content stored on the Website and application is stored by Us only for permitted temporary online sharing purposes and not for permanent or long-term storage or for temporary archival purposes. We will not, and are not
    obligated to, maintain back-up copies of any and all Content or any of Your Darasa account information. Accordingly, Darasa will bear no responsibility or liability for any loss of Content or other information stored or
    submitted to the Website and application.</p>
  <p>13.1.2. Content provided on Darasa is not in any way or form guaranteed to be accurate or to fully satisfy Your need for the content. We are hereby released from all forms of liability arising from this.</p>
  <p>13.2 <u>Dispute Resolution</u>. You acknowledge that We possess valuable and proprietary information, including copyright and business practices, which would be damaging to Us if revealed in open court. You further acknowledge and
    agree that it is preferable to resolve all disputes confidentially, individually and in an expeditious and inexpensive manner. We and You accordingly acknowledge and agree that private dispute resolution is preferable to court
    actions. Before commencing any arbitration process, We and You shall first attempt to resolve any dispute or differences between the both of Us by way of
    good faith negotiation. The good faith negotiation shall commence by each of Us and You communicating Our position regarding the complaint, claim, dispute or controversy to the other party, and how the both of Us should resolve
    the dispute. We and You shall then make good faith efforts to negotiate a resolution of the claim, dispute or controversy. Neither We nor You shall commence any arbitral proceedings unless and until the good faith negotiation fails.
  </p>
  <p>13.3 <u>LAW</u>. The law applicable and governing this Agreement is the law of the Republic of Kenya.</p>
  <h4>14. SUCCESSORS AND ASSIGNS</h4>
  <p>14.1 <u>Successors and Assigns</u>. You may not assign Your rights and duties under this Agreement to any party at any time. This Agreement will endure to the benefit of and will be binding on Us and Our respective successors and
    permitted assigns. In the event of corporate merger, amalgamation, divestiture or asset sale, We will have the right to transfer and assign Our rights and obligations hereunder to any third party (the &quot;Assignee&quot;), upon written notice
    to You, provided that We cause the Assignee to agree in writing to all the terms contained in this Agreement.</p>
  <h4>15. CONFIDENTIALITY</h4>
  <p>15.1 <u>Confidentiality</u>. You acknowledge that the existence of this Agreement, the terms and conditions hereof, the transactions contemplated hereby and other information, including, without limitation, customer, technical and financial
    information that they have received or will receive in connection with this Agreement, is considered private and confidential (the &quot;Confidential Information&quot;). You will Use reasonable diligence and in no event less than the degree of
    care which We Use in respect to Our own confidential and proprietary information of like nature, to prevent the unauthorized disclosure, reproduction or distribution of such Confidential Information to any other individual, corporation
    or entity. Such Confidential Information will exclude:</p>
  <ul>
    <li>(a) information that is already in the public domain;</li>
    <li>(b) information already known to the receiving party, as of the date of the disclosure, unless the receiving party agreed to keep such information in confidence at the time of its original receipt;</li>
    <li>(c) information hereafter obtained by the receiving party, from a source not otherwise under an obligation of confidentiality with the disclosing party;</li>
    <li>(d) information that the receiving party is obligated to produce under order of a court of competent jurisdiction, provided that the receiving party promptly notifies the disclosing party of such an event so that the disclosing party may seek an appropriate protective order.</li>
  </ul>
  <h4>16. GENERAL</h4>
  <p>16.1 <u>Consents</u>. Any consent required under this Agreement will not be unreasonably withheld.</p>
  <p>16.2 <u>Captions</u>. The Article and paragraph headings Used herein are for convenience only and are not a part of this Agreement and will not be Used in construing it.</p>
  <p>16.3 <u>Entire Agreement</u>. This Agreement constitutes the entire agreement of the Parties, and no amendment to the terms of this Agreement will be effective unless in writing and signed by both parties hereto.</p>
  <p>16.4 <u>Equitable Relief</u>. You agree that any breach of this Agreement by You would cause irreparable damage, and that, in event of such breach, in addition to any and all remedies at law, We will have the right to an injunction, specific performance or other equitable relief to prevent the continuous violations of the terms of this Agreement.</p>
  <p>16.5 <u>Force Majeure</u>. Notwithstanding anything herein to the contrary, We shall not be liable for any delay or failure in performance caused by circumstances beyond Our reasonable control.</p>
  <p>16.6 <u>Relationship of the Parties</u>. This Agreement does not constitute a partnership or joint venture, and nothing herein contained is intended to constitute, nor will it be construed to constitute, such a partnership or joint venture. Except as expressly provided in this Agreement, neither We nor You will have any power or authority to act in the name or on behalf of the other party, or to bind the other party to any legal agreement.</p>
  <p>16.7 <u>Severability</u>. The provisions of this Agreement are to be considered separately, and if any provision hereof should be found by any court of competent jurisdiction to be invalid or unenforceable, this Agreement will be deemed to have effect as if such provision Were severed from this Agreement.</p>
  <p>16.8 <u>Number and Gender</u>. Where the context permits, the singular includes the plural, and the masculine includes the feminine and vice versa.</p>
  <p>16.9 <u>Notices</u>. All notices and communications required or permitted under this Agreement will be in writing and will be sent by registered or certified mail, postage prepaid, return receipt requested, facsimile transmission (the &quot;Fax&quot;), with confirmed answer back, or electronic mail, with confirmation of receipt, to Us or You at the respective addresses We provide to each other or to such other address as We or You may from time to time specify by notice to the other given as provided in this paragraph. In Our case, Our address is:</p>
  <p><em>[Surveyors Court, 1st Floor, Room A4, Westlands, PO BOX 1963 00606, <a href="mailto:edwin@awesomenairobi.com" target="_blank">edwin@awesomenairobi.com</a>]</em></p>
  <p>A notice given in electronic form shall be admissible in judicial or administrative proceedings based upon or relating to this Agreement to the same extent and subject to the same conditions as other business documents and records originally generated and maintained in printed form.</p>
  <p>16.10 <u>Revisions to this Agreement</u>. We may at any time revise the terms of this Agreement by updating these terms and by providing notice to You of that change.</p>
'].each do |term|
  Term.find_or_create_by({terms: term})
 end